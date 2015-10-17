require "coveralls"
Coveralls.wear!

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "activemodel-email_address_validator"

require "minitest/autorun"
require "minitest/spec"
