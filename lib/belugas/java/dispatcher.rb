module Belugas
  module Java
    class Dispatcher
      def initialize(java_file_path)
        @java_version = Belugas::Java::Identifier.new(java_file_path).java_version
        @feature_handler = Belugas::Java::Feature::Handler.new(java_version_feature)
      end

      def render
        @feature_handler.encode.each do |feature|
          STDOUT.print feature.to_json
          STDOUT.print "\0"
        end
      end

      private

      def java_version_feature
        @java_version_feature ||= [{
          'type' => 'feature',
          'name' => 'Java',
          'version' => @java_version,
          'description' => 'The application uses Java code',
          'categories' => ['Language'],
          'engines' => ['belugas-linguist', 'belugas-java']
        }]
      end
    end
  end
end
