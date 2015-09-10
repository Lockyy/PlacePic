# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'placepic/version'

Gem::Specification.new do |spec|
  spec.name          = "placepic"
  spec.version       = PlacePic::VERSION
  spec.authors       = ["Daniel Lockhart"]
  spec.email         = ["daniel@lockyy.com"]

  spec.summary       = %q{Generate a random placeholder image from various placeholder sites}
  spec.description   = %q{Generate a random placeholder image url or tag from
                         placebear, stevensegallery, fillmurray,
                         placecage, or lorempixel.}
  spec.homepage      = "https://github.com/Lockyy/PlacePic."
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.10"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec"
end
