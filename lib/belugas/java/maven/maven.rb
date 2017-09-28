require 'belugas/java/feature/builder'
require 'belugas/java/standar_names/base'
require_relative 'parser/properties'
require_relative 'parser/dependencies'
require 'find'
require 'nokogiri'
require 'pry'

module Belugas
  module Java
    module Maven
      class Maven
        def initialize(path)
          @path = path
          @properties = Belugas::Java::Maven::Parser::Properties.new(document)
          @dependencies = Belugas::Java::Maven::Parser::Dependencies.new(document)
        end

        def pom_path
          @pom_path ||= find_pom_file
        end

        def find_pom_file
          Find.find(@path) do |path|
            return path if path =~ /pom\.xml$/
          end
        end

        def features
          @features ||= @dependencies.dependencies.map do |dep|
            feat = Belugas::Java::Feature::Builder.new(dep)
            feat
          end
          @features
        end

        def java_version
          @properties.java_version
        end

        def document
          @document ||= Nokogiri::XML(File.open(pom_path))
        end
      end
    end
  end
end
