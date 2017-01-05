require "thor"
require "json"
require "belugas/java/dispatcher"

module Belugas
  module Java
    class Sonar < Thor
      package_name "belugas-java"

      desc "analyze --requirements-path=/app/code", "Java feature detection JSON"
      method_option "requirements-path", type: :string, default: "", required: false, aliases: "-p"
      def analyze
        dispatcher = Belugas::Java::Dispatcher.new(options["requirements-path"])
        dispatcher.render
      end
    end
  end
end

require "belugas/java/version"
