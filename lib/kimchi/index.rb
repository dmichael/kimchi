module Kimchi
  def self.indicies
    @indicies ||= {}
  end

  def self.Index(name = 'default')
    indicies[name] = Index.new(name) unless indicies[name]
    indicies[name] 
  end

  class Index
    attr_accessor :config, :name

    def initialize(name)
      @name   = name
      @config = Configuration.new
    end

    def configure &block
      @config.instance_eval &block
      self
    end

    def client
      @client ||= ::Elasticsearch::Client.new({
        log:  @config.log,
        host: @config.uri
      })
    end

    def index(type, document)
      client.index index: @name, type: type, body: document
    end

    def exists
      client.indices.exists(index: @name)
    end

    def create
      create! unless exists
    end

    def delete
      delete! if exists
    end

    def create!
      client.indices.create index: @name, body: {
        settings: @config.settings,
        mappings: @config.mappings
      }
    end

    def delete!
      client.indices.delete index: @name
    end

  end

  class Configuration
    include Virtus
    attribute :log,       Boolean, default: true
    attribute :_uri,      String, default: "localhost:9200" 
    attribute :_settings, Hash, default: {}

    def settings(arg = nil)
      return self._settings if arg.nil?
      self._settings = arg
    end

    def mappings
      @mappings ||= {}  
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

