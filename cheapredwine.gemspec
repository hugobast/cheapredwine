# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'cheapredwine/version'

Gem::Specification.new do |gem|
  gem.name          = "CheapRedWine"
  gem.version       = CheapRedWine::VERSION
  gem.authors       = ["Hugo Bastien"]
  gem.email         = ["hugo@hbastien.com"]
  gem.description   = %q{I needed a way to test fonts on the web. I based this library on myfonts.com. CheapRedWine makes use to Harfbuzz' hb-view utility to generate images from fonts with a slew of different parameters. It also uses fontTools' ttx utility for font introspection.}
  gem.summary       = %q{I needed a way to test fonts on the web. I based this library on myfonts.com. CheapRedWine makes use to Harfbuzz' hb-view utility to generate images from fonts with a slew of different parameters. It also uses fontTools' ttx utility for font introspection.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency 'rspec'

  gem.add_dependency 'nokogiri'
end
