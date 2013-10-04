module Kimchi
  def self.indicies
    @indicies ||= {}
  end

  def self.default_index
    @default_index || 'default'
  end

  def self.default_index=(name)
    @default_index = name
  end

  def self.Index(name = nil)
    name ||= default_index
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

    def client(params = {})
      @client ||= Client.new log: @config.log, host: @config.uri
      @client.client(params)
    end

    def search(args = {})
      results = client(args).search({index: @name}.merge(args))
      return results if args[:passthrough]
      Kimchi::Response::Search.load(results)
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

    def get(id, options = {})
      client.get( {index: @name, type: '_all', id: id}.merge(options) )
    end

    def get_source(id, options = {})
      client.get_source({ index: @name, type: '_all', id: id }.merge(options))
    end

    def health
      client.cluster.health
    end

  end
end

