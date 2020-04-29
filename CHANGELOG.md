# Change log

## master (unreleased)

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
