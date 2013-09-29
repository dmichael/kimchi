module Kimchi
  module Mapping

  	def self.included klass
      @mappings ||= []
      @mappings << klass
    end

    def self.mappings
      @mappings.reduce({}) do |hash, klass|
        hash[klass.type] = klass.mapping
        hash
      end
    end

  end
end