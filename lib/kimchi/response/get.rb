module Kimchi
  module Response
    class Get
      # include Virtus
      
      def initialize(json)
        @raw = MultiJson.load(json)
      end

      def total
      end
      

    end
  end
end