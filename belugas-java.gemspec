# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'belugas/java/version'

Gem::Specification.new do |spec|
  spec.name          = "belugas-java"
  spec.version       = Belugas::Java::VERSION
  spec.authors       = ["Roberto Quintanilla", "Abraham Kuri", "Cejas"]
  spec.email         = ["weare@icalialabs.com"]

  spec.summary       = %q{A Ruby CLI for java feature detection}
  spec.description   = %q{A Ruby CLI for java feature detection using awesome Belugas}
  spec.homepage      = "https://github.com/icalialabs/belugas-java"
  spec.license       = "MIT"

  spec.bindir        = "bin"
  spec.executables   = ["belugas-java"]
  spec.require_paths = ["lib"]

  spec.add_dependency "thor", "~> 0.19"
  spec.add_dependency "bundler", "~> 1.13"
  spec.add_dependency "rubyzip", "~> 1.2"
  spec.add_dependency "pry", "0.10"

  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
end
