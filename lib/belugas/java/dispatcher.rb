
module Belugas
  module Java
    class Dispatcher
      def initialize(path)
        @manage_dependencies = Belugas::Java::Maven::Maven.new(path)
        @feature_handler = Belugas::Java::Feature::Handler.new(java_version_feature)
      end

      def render
        append_features
        @feature_handler.encode.each do |feature|
          STDOUT.print feature.to_json
          STDOUT.print "\0"
        end
      end

      def append_features
        @manage_dependencies.features.each do |feature|
          transcoded[feature.name] = feature.attributes
        end
      end

      def transcoded
        @transcoded ||= @feature_handler.transcode
      end

      private

      def java_version_feature
        @java_version_feature ||= [{
          'type' => 'feature',
          'name' => @manage_dependencies.java_platform,
          'version' => @manage_dependencies.java_version,
          'description' => 'The application uses Java code',
          'categories' => ['Language'],
          'engines' => ['belugas-linguist', 'belugas-java']
        }]
      end
    end
  end
end
