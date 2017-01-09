module Belugas
  module Java
    class JavaFile
      def self.get(path)
        @instance = self.new(path)

        @instance.any_jar_file
      end

      def initialize(path)
        @path = path
      end

      def any_jar_file
        possible_file = Dir[@path + "/**/*.jar"].first
        raise "No Jar file found." unless possible_file

        possible_file
      end
    end
  end
end
