module Belugas
  module Java
    module Maven
      class Dependency
        def initialize(maven_dependency)
          @maven_dependency = maven_dependency
        end

        def name
          @maven_dependency.search('groupId').text
        end

        def version
          clean_version
        end

        def categories
          StandardNames::NAMES[name] && StandardNames::NAMES[name]['categories']
        end

        private

        def clean_version
          version = @maven_dependency.search('version').text
          (version.match /([0-9]\.*[0-9]*).*/)[1].to_s
        end
      end
    end
  end
end
