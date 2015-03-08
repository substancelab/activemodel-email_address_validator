require "activemodel-email_address_validator/version"
require "validator/email_address_validator"

module ActiveModelEmailAddressValidator
  # This is the default regular expression used to validate email addresses. It
  # doesn't cover all cases of invalid, nor valid, email addresses, so don't
  # expect it to be a generic RFC compliant expression.
  DEFAULT_VALID_EMAIL_PATTERN = /^[^.]\w+@([^\,.@ ]+\.)+[^\,. ]+$/
end
