# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'ministub/version'

Gem::Specification.new do |spec|
  spec.name          = "ministub"
  spec.version       = Ministub::VERSION
  spec.authors       = ["Jonathon M. Abbott"]
  spec.email         = ["jma@dandaraga.net"]
  spec.description   = %q{Very small stubs, looks like rspec}
  spec.summary       = %q{Very small stubs}
  spec.homepage      = "https://github.com/JonathonMA/ministub"
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.3"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
