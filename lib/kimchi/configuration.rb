# This is really an index configuration
module Kimchi
  class Configuration
    include Virtus
    attribute :log,       Boolean, default: true
    attribute :_uri,      String, default: "localhost:9200" 
    attribute :_settings, Hash, default: {}

    def settings(arg = nil)
      return self._settings if arg.nil?
      self._settings = arg
    end

    def models
      @models ||= {}  
    end

    def mappings
      @mappings ||= {}  
    end

    def model(type, klass)
      models[type] = klass
    end 

    def mapping(type, map)
      mappings[type] = map
    end

    def uri(address = nil)
      return self._uri if address.nil?
      self._uri = address
    end
  end
end