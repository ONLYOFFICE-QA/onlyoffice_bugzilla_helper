lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'onlyoffice_bugzilla_helper/version'

Gem::Specification.new do |spec|
  spec.name          = 'onlyoffice_bugzilla_helper'
  spec.version       = OnlyofficeBugzillaHelper::VERSION
  spec.authors       = ['Pavel Lobashov', 'ONLYOFFICE']
  spec.email         = ['shockwavenn@gmail.com']

  spec.summary       = 'Helper for bugzilla'
  spec.description   = 'Helper for bugzilla, used in QA'
  spec.homepage      = 'http://rubygems.org/gems/onlyoffice_bugzilla_helper'

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.16'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
