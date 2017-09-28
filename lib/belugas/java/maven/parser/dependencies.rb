require 'belugas/java/maven/dependency'
module Belugas
  module Java
    module Maven
      module Parser
        class Dependencies
          def initialize(document)
            @document = document
          end

          def pom_dependencies
            @pom_dependencies ||= @document.search('project/dependencies/dependency')
          end

          def dependencies
            @maven_dependencies ||= pom_dependencies.map do |dep|
              dependency = Belugas::Java::Maven::Dependency.new(dep)
              dependency
            end
          end
        end
      end
    end
  end
end
