# You know, this class really only normalizes the response from Elasticsearch
# - its not really that different.

module Kimchi
  module Response

    class Search
      include Virtus, Adamantium
      
      attribute :took,      Integer
      attribute :timed_out, Boolean
      attribute :_shards,   Attributes::Hashie

      attribute :total,     Integer
      attribute :max_score, Integer
      attribute :hits,      Array[Hit]
      # attribute :facets,    Array[Facet],  default: []
      attribute :highlight, Array[String], default: []

      alias_method :shards, :_shards

      def self.load(json)
        raw = json.is_a?(String) ? MultiJson.load(json) : json

        raw.delete('facets')
        
        response = new(raw.merge({
          total:     raw['hits'].delete('total'),
          max_score: raw['hits'].delete('max_score'),
          hits:      raw['hits'].delete('hits')
        }))
      end

    end

  end
end