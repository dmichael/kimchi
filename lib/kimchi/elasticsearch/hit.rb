module Kimchi
  module Elasticsearch  
    class Hit
      include Virtus

      attribute :_index,  String
      attribute :_type,   String
      attribute :_id,     String
      attribute :_score,  Integer

      attribute :_source, Attributes::Hashie
      attribute :fields,  Attributes::Hashie

      alias_method :index,  :_index
      alias_method :type,   :_type
      alias_method :id,     :_id
      alias_method :score,  :_score

      def source
      	_source || fields
      end

    end
  end
end
