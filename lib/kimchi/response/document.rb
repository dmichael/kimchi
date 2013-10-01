module Kimchi
  module Response
    class Document < Hit
      attribute :_version, Integer
      attribute :exists, Boolean
      alias_method :version, :_version

      def self.load(json)
        raw = json.is_a?(String) ? MultiJson.load(json) : json
        new(raw)
      end
    end
  end
end