require 'thor'
require 'json'
require 'belugas/java/extractor'
require 'belugas/java/identifier'
require 'belugas/java/feature/handler'
require 'belugas/java/java_file'
require 'belugas/java/dispatcher'

module Belugas
  module Java
    class Sonar < Thor
      package_name 'belugas-java'

      desc 'analyze', 'Java feature detection JSON'
      def analyze
        java_file_path = Belugas::Java::JavaFile.get('/code')
        dispatcher = Belugas::Java::Dispatcher.new(java_file_path)
        dispatcher.render
      end
    end
  end
end

require 'belugas/java/version'
