module Belugas
  module Java
    module Feature
      class Handler
        def initialize(data)
          @data = data
        end

        def transcode
          @transcode ||= @data.each_with_object({}) do |feature, hash|
            hash[feature['name']] = feature
          end
        end

        def encode
          transcode.values
        end
      end
    end
  end
end
