# Change log

## master (unreleased)

### Changes

* Require ruby v2.4 or newer
* Fix new warnings from `rubocop` v0.89.0 update

## 0.4.0 (2020-07-09)

### New Feature

* Add test to check `BugzillaHelper.token_read`
* Add options to `BugzillaHelper.token_read`
* Remove support of `codecov`
* Use `GitHub Actions` instead of Travis CI
* Add `rubocop` check to GitHub Actions
* Add `rubocop-rake` support
* Add `markdownlint` checks in GitHub Actions
* Add missing documentation
* Check for documentation coverage in GitHub Actions
* Add `yard` as development dependency

### Fixes

* Fix `BugzillaHelper#bug_exists?` after removing Testopia

### Changes

* Move `rubocop` dependencies in Gemfile
* Store specific version of `rubocop` dependencies

## 0.3.2 (2020-04-29)

* Fix forgotten version bump

## 0.3.1 (2020-04-29)

### Fixes

* Fix incorrect gem name

## 0.3.0 (2020-04-29)

### New features

* Ability to change bug status
* Ability to get comments
* Ability to add comments
* Store all develop dependencies in Gemfile
* `mardkownlint` support in travis
* Add task to release gem on github

### Changes

* Deprecate auto-detect port. Since now full `bugzilla_url` with scheme is required.
* Cleanup gemspec file
* Use actual ruby in travis test
* Minor cleanup of travis config

## 0.2.0 (2018-05-15)

### New features

* New method `BugzillaHelper#bug_exists?`
* Extract  `BugzillaHelper#bug_data` to separate method

## 0.1.1 (2018-05-15)

* Fix getting id from string with spaces

## 0.1.0

* Initial Release