# # coding: utf-8
# lib = File.expand_path('../lib', __FILE__)
# $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)


$:.push File.expand_path('../lib', __FILE__)
require 'contactually/version'

Gem::Specification.new do |spec|
  spec.name          = "contactually-cmd"
  spec.version       = Contactually::VERSION
  spec.authors       = ["Henry Poydar"]
  spec.email         = ["hpoydar@gmail.com"]
  spec.summary       = %q{Command line access to Contactually data}
  spec.homepage      = "https://github.com/hpoydar/contactually-cmd"
  spec.license       = "MIT"

  # spec.files         = `git ls-files -z`.split("\x0")
  spec.files         = `git ls-files`.split($/)
  # spec.files = Dir['{lib}/**/*'] + ['LICENSE.txt', 'Rakefile', 'README.md']
  spec.executables   = spec.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  # spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.test_files     = Dir['test/**/*']
  spec.require_paths = ["lib"]

  spec.add_dependency 'httparty', '~> 0.13.3'
  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"
end
