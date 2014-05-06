# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'feature_release/version'

Gem::Specification.new do |spec|
  spec.name          = "feature_release"
  spec.version       = FeatureRelease::VERSION
  spec.authors       = ["Kavinder Dhaliwal"]
  spec.email         = ["kavinderd@gmail.com"]
  spec.summary       = %q{Rollout features to some users (Rollout gem clone)}
  spec.description   = %q{Allows you to restrict access of portions of an app to certain users}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
end
