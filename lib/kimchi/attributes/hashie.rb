module Kimchi
  module Attributes
    
    class Hashie < Virtus::Attribute::Object
      def coerce(value)
        ::Hashie::Mash.new value
      end
    end

  end
end
