module Kimchi
  module Response
    class Document < Hit
      attribute :_version, Integer
      attribute :exists, Boolean
      alias_method :version, :_version
    end
  end
end