# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'eventmapper/version'

Gem::Specification.new do |spec|
  spec.name          = "eventmapper"
  spec.version       = EventMapper::VERSION
  spec.authors       = ["Caleb Albritton"]
  spec.email         = ["ithinkincode@gmail.com"]
  spec.summary       = %q{EventMapper is just a small event library}
  spec.description   = %q{EventMapper is just a small event library for Ruby I'm writing for a small side project. It's pretty simple and works pretty much the way you'd expect events to work in JavaScript.}
  spec.homepage      = "https://github.com/C0deMaver1ck/EventMapper"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 2.2"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
  spec.add_development_dependency "pry"
end
