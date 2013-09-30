module Kimchi
  module Serializer
    class Passthrough
      def initialize(transport=nil)
        @transport = transport
      end

      # used by the Client class for deserializing the body of the response
      # ... note that this still gets wrapped in a Response object by the lib
      def load(string, options={})
        string
      end

      def dump(object, options={})
        ::MultiJson.dump(object, options)
      end
    end  
  end
end
