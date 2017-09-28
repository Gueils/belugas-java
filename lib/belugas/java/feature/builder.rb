module Belugas
  module Java
    module Feature
      class Builder
        attr_reader :name

        def initialize(dependency)
          @dependency = dependency
        end

        def attributes
          {
            'type' => 'feature',
            'name' => @dependency.name,
            'version' => @dependency.version,
            'description' => "The application uses #{@dependency.name}",
            'content' => '',
            'categories' => @dependency.categories,
            'cue_locations' => [''],
            'engines' => ['belugas', 'belugas-java']
          }
        end
      end
    end
  end
end
