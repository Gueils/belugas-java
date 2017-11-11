module Belugas
  module Java
    module Feature
      class Builder
        attr_reader :name, :version, :categories

        def initialize(dependency)
          @dependency = dependency
        end

        def name
          @dependency.name
        end

        def cue_locations
          @cue_locations ||= (@dependency.respond_to? :cue_locations)? @dependency.cue_locations : ['']
        end

        def attributes
          {
            'type' => 'feature',
            'name' => @dependency.name,
            'version' => @dependency.version,
            'description' => "The application uses #{@dependency.name}",
            'content' => '',
            'categories' => @dependency.categories,
            'cue_locations' => cue_locations,
            'engines' => ['belugas', 'belugas-java']
          }
        end
      end
    end
  end
end
