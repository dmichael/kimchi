module Kimchi
  module Mapping
    extend ActiveSupport::Concern
    

    module Registry
      def self.mappings
        @mappings ||= []  
      end

      def self.dump
        mappings.reduce({}) do |hash, klass|
          hash[klass.get_type] = klass.get_mapping
          hash
        end
      end
    end

    def self.included klass
      Registry.mappings << klass
      klass.class_eval do
        extend ClassMethods
      end
    end

    module ClassMethods
      def get_type
        @type
      end

      def get_mapping
        @mapping
      end

      def type(name)
        @type = name
      end

      def mapping(&block)
        @mapping = yield
      end
    end

  end
end