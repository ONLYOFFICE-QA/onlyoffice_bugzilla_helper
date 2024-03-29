# frozen_string_literal: true

require_relative 'lib/onlyoffice_bugzilla_helper/name'
require_relative 'lib/onlyoffice_bugzilla_helper/version'

Gem::Specification.new do |s|
  s.name = OnlyofficeBugzillaHelper::NAME
  s.version = OnlyofficeBugzillaHelper::VERSION
  s.platform = Gem::Platform::RUBY
  s.required_ruby_version = '>= 3.0'
  s.authors = ['ONLYOFFICE', 'Pavel Lobashov']
  s.summary = 'Helper for bugzilla'
  s.description = 'Helper for bugzilla, used in QA'
  s.homepage = "https://github.com/ONLYOFFICE-QA/#{s.name}"
  s.metadata = {
    'bug_tracker_uri' => "#{s.homepage}/issues",
    'changelog_uri' => "#{s.homepage}/blob/master/CHANGELOG.md",
    'documentation_uri' => "https://www.rubydoc.info/gems/#{s.name}",
    'homepage_uri' => s.homepage,
    'source_code_uri' => s.homepage,
    'rubygems_mfa_required' => 'true'
  }
  s.email = ['shockwavenn@gmail.com']
  s.files = Dir['lib/**/*']
  s.license = 'AGPL-3.0'
end
