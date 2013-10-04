module Kimchi
  module Response
    class Document < Hit
      attribute :_version, Integer
      attribute :exists, Boolean
      attribute :_source, Attributes::Hashie
      attribute :fields,  Attributes::Hashie

      def source
        _source || fields
      end

      alias_method :version, :_version

      def self.load(json)
        raw = json.is_a?(String) ? MultiJson.load(json) : json
        new(raw)
      end
    end
  end
end