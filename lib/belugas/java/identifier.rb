module Belugas
  module Java
    class Identifier
      JAVA_VERSIONS = {
        '35' => '1.9.0',
        '34' => '1.8.0',
        '33' => '1.7.0',
        '32' => '1.6.0',
        '31' => '1.5.0',
        '30' => '1.4.0',
        '2f' => '1.3.0',
        '2e' => '1.2.0',
        '2d' => '1.1.0'
      }.freeze

      def initialize(path)
        @class_file_path = Belugas::Java::Extractor.do(path)
      end

      def java_version
        JAVA_VERSIONS[hexcode_version] || '0.0.0'
      end

      private

      def hexcode_version
        magic_number.to_s(16)
      end

      def class_file
        File.open(@class_file_path)
      end

      def magic_number
        class_file.read(9)[6..7].unpack('n').first
      end
    end
  end
end
