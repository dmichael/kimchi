module Kimchi
  module Elasticsearch
    class GetResponse
      # include Virtus
      
      def initialize(json)
        @raw = MultiJson.load(json)
      end

      def total
      end
      

    end
  end
end