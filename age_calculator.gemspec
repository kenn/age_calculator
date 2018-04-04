# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'age_calculator/version'

Gem::Specification.new do |spec|
  spec.name          = 'age_calculator'
  spec.version       = AgeCalculator::VERSION
  spec.authors       = ['Kenn Ejima']
  spec.email         = ['kenn.ejima@gmail.com']
  spec.summary       = %q{A simple age calculator that just works}
  spec.description   = %q{A simple age calculator that just works}
  spec.homepage      = 'https://github.com/kenn/age_calculator'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'minitest'
  spec.add_development_dependency 'activemodel', '>= 4.1' # ActiveSupport::Testing::TimeHelpers
end
