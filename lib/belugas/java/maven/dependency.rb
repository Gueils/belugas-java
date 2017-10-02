module Belugas
  module Java
    module Maven
      class Dependency
        def initialize(maven_dependency)
          @maven_dependency = maven_dependency
        end

        def dependency_name
          @maven_dependency.search('groupId').text
        end

        def name
          return StandardNames::NAMES[dependency_name]['standard_name'] if StandardNames::NAMES.key? dependency_name
          dependency_name
        end

        def version
          clean_version
        end

        def categories
          StandardNames::NAMES[dependency_name] && StandardNames::NAMES[dependency_name]['categories']
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
