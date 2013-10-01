require 'rubygems'
require 'bundler/setup'
require 'virtus'
require 'active_support/concern'
require 'active_support/core_ext/hash'
require 'multi_json'
require 'hashie'
require 'adamantium'
require 'elasticsearch'

module Kimchi
  def self.connect(args = {})
    index = args.delete(:index)
  end

  class Connection
  end
end

require 'kimchi/version'
require 'kimchi/serializer/passthrough'
require 'kimchi/client'
require 'kimchi/configuration'
require 'kimchi/index'

require 'kimchi/attributes/hashie'
require 'kimchi/response/hit'
require 'kimchi/response/facet'
require 'kimchi/response/search'
require 'kimchi/response/document'

