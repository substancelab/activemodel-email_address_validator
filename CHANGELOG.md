# Change Log

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](http://keepachangelog.com/)
and this project adheres to [Semantic Versioning](http://semver.org/).

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
