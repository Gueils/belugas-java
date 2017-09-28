require 'thor'
require 'json'
require 'belugas/java/feature/handler'
require 'belugas/java/dispatcher'
require 'belugas/java/maven/maven'

module Belugas
  module Java
    class Sonar < Thor
      package_name 'belugas-java'

      desc 'analyze', 'Java feature detection JSON'
      method_option 'java-code', type: :string, default: '.', required: false, aliases: '-p'
      def analyze
        dispatcher = Belugas::Java::Dispatcher.new(options['java-code'])
        dispatcher.render
      end
    end
  end
end

require 'belugas/java/version'
