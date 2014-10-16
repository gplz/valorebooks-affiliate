# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'valorebooks/version'

Gem::Specification.new do |spec|
  spec.name          = "valorebooks-affiliate"
  spec.version       = Valorebooks::VERSION
  spec.authors       = ["Gilbert Pleczynski"]
  spec.email         = ["gpleczynski@belltowerbooks.com"]
  spec.summary       = %q{Valorebooks AFFILIATE API}
  spec.description   = %q{Affiliate API Gem}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "rest-client"

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
