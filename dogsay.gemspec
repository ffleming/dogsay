# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dogsay/version'

Gem::Specification.new do |spec|
  spec.name          = "dogsay"
  spec.version       = Dogsay::VERSION
  spec.authors       = ["Forrest Fleming"]
  spec.email         = ["ffleming@gmail.com"]
  spec.summary       = %q{Like cowsay, but with a dog}
  spec.description   = %q{Prints CLI arguments or STDIN in a speech bubble, said by a dog.  Dogs are better than cows, after all.}
  spec.homepage      = 'http://github.com/ffleming/dogsay'
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(spec)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency 'bundler', '~> 1', '>= 1.6.5'
  spec.add_development_dependency 'rspec', '~> 3'
  spec.add_development_dependency 'simplecov', '~> 0'
end
