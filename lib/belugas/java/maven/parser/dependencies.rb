require 'belugas/java/maven/dependency'
module Belugas
  module Java
    module Maven
      module Parser
        class Dependencies
          def initialize(document)
            @document = document
            @dependencies = []
            append_dependencies
          end

          def pom_dependencies
            @pom_dependencies ||= @document.search('project/dependencies/dependency')
          end

          def dependencies
            @dependencies
          end

          def append_dependencies
            pom_dependencies.map do |dep|
              next unless StandardNames::NAMES.key? dep.search('groupId').text
               @dependencies << Belugas::Java::Maven::Dependency.new(dep)
            end
          end
        end
      end
    end
  end
end
