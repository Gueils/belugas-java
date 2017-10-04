module Belugas
  module Java
    module Maven
      module Parser
        class Properties

          JAVA_VERSION_DEFAULT = '1.8'.freeze

          def initialize(document)
            @document = document
          end

          def packaging
            @document.at('project packaging').text
          end

          def java_version
            source = @document.search("project/properties/[name() = 'maven.compiler.source']").first
            if source.nil?
              source = @document.search('project/build/plugins/plugin/configuration/source').first
            end
            source = JAVA_VERSION_DEFAULT if source.nil?
            source.text
          end
        end
      end
    end
  end
end
