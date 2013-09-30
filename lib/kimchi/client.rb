module Kimchi  
  class Client
    def initialize(params = {})
      @params = params
    end
    
    def standard
      @standard ||= ::Elasticsearch::Client.new(@params)
    end

    # The results of the action are a string, not a Hash
    def passthrough
      @passthrough ||= ::Elasticsearch::Client.new(@params.merge({
        serializer_class: Kimchi::Serializer::Passthrough
      }))
    end

    def client(params={})
      if params.delete(:passthrough)
        passthrough
      else
        standard
      end
    end

  end
end