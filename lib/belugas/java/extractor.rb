require 'zip'

module Belugas
  module Java
    class Extractor
      def self.do(path)
        jar_file = self.new(path)

        jar_file.sample
      end

      def initialize(path)
        @path = path
      end

      def sample
        unzip

        File.open(Dir["/tmp/*.class"].first)
      end

      private

      def unzip
        Zip::File.open(@path, Zip::File::CREATE) do |zip_file|
          zip_file.each do |file|
            if file.name.split(".")[1] == "class"
              file_path = File.join("/tmp", file.name)
              zip_file.extract(file, file_path) unless File.exists?(file_path)
              break
            end
          end
        end
      end
    end
  end
end
