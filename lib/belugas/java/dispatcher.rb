
module Belugas
  module Java
    class Dispatcher
      def initialize(path)
        @manage_dependencies = Belugas::Java::Maven::Maven.new(path)
      end

      def render
        feactures.each do |feature|
          STDOUT.print feature.to_json
          STDOUT.print "\0"
        end
      end

      def feactures   
        @feactures ||= [].tap do |obj|
          obj << java_version_feature
          @manage_dependencies.features.each do |name,feature|
            obj << feature.attributes
          end
        end
      end

      private

      def java_version_feature
        @java_version_feature ||= {
          'type' => 'feature',
          'name' => @manage_dependencies.java_platform,
          'version' => @manage_dependencies.java_version,
          'description' => 'The application uses Java code',
          'categories' => ['Language'],
          'engines' => ['belugas-linguist', 'belugas-java']
        }
      end
    end
  end
end
