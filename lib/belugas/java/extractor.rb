require 'zip'

module Belugas
  module Java
    class Extractor
      def self.do(path)
        jar_file = new(path)

        jar_file.sample
      end

      def initialize(path)
        @path = path
      end

      def sample
        unzip

        File.open(Dir['/tmp/*.class'].first)
      end

      private

      def unzip
        Zip::File.open(@path, Zip::File::CREATE) do |zip_file|
          zip_file.each do |file|
            next unless file.name.split('.')[1] == 'class'
            file_path = File.join('/tmp', file.name.split('/').last)
            zip_file.extract(file, file_path) unless File.exist?(file_path)
            break
          end
        end
      end
    end
  end
end
