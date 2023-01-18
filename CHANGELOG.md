# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

## [2.1.1]

### Added

- Support for ActiveModel 7.

- Support for Ruby 3.1 and 3.2.

- Commas are no longer allowed anywhere in an email address. Thanks
  @prognostikos!

## [2.1.0]

### Added

- Support for Ruby 3.0. We've also started testing against Ruby 3.1 to be
  prepared.

- Email addresses with trailing @'s are no longer accepted. Thanks
  @prognostikos!

## [2.0.0]

### Added

- Ability to specify custom rules to use when validating the email address
  using the `:with` option.

- Support for Ruby 2.5, 2.5 and 2.6. We've probably always had the support,
  but now we're actually testing it.

- Support for ActiveModel 6.

### Removed

- Support for Ruby 2.2 and 2.3 that are both EOL. We probably still support
  and work on those versions, but we won't verify and test them any more.

## [1.0.1]

### Added

- Reject email addresses with tildes in the hostname

## [1.0.0]

### Added

- Support for ActiveModel versions 5 and up
- A changelog

### Changed

- Removed support for Ruby versions older than 2.2.2. ActiveSupport 5.0.0.1
  requires Ruby version >= 2.2.2 so to support ActiveModel 5, which requires
  ActiveSupport 5, we have to say goodbye to Ruby 2.1. If you need to use a
  Ruby version prior to 2.2.2, version 0.1.0 of this gem should still work just fine.
