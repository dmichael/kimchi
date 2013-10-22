# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'kimchi/version'

Gem::Specification.new do |spec|
  spec.name          = "kimchi"
  spec.version       = Kimchi::VERSION
  spec.authors       = ["David Michael"]
  spec.email         = ["david.michael@giantmachines.com"]
  spec.description   = %q{A library for creating Ruby objects from Elasticsearch results}
  spec.summary       = %q{}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency 'rspec',   '>= 2.5.0'

  spec.add_dependency "adamantium", "~> 0.1.0"
  # spec.add_dependency "virtus", "~> 1.0.0.beta8"
  spec.add_dependency "virtus", "~> 0.5.5"
  spec.add_dependency 'activesupport'
  spec.add_dependency 'multi_json',      '~> 1.7.3'
  spec.add_dependency 'hashie',      '~> 2.0'
end
