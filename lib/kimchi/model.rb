module Kimchi
  module Model
    extend ActiveSupport::Concern
    # include Virtus.module

    module ClassMethods
      def load(json)
        response = new MultiJson.load(json)
      end
    end

  end
end