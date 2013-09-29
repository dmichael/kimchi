require 'rubygems'
require 'bundler/setup'
require 'virtus'
require 'active_support/concern'
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
require 'kimchi/index'

require 'kimchi/attributes/hashie'
require 'kimchi/response/hit'
require 'kimchi/response/facet'
require 'kimchi/response/search'
require 'kimchi/mapping'
require 'kimchi/model'

