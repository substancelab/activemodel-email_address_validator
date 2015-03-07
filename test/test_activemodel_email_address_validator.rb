require 'minitest_helper'
require 'active_model'

# Create a class we can validate with
class WithEmail
  include ActiveModel::Validations
  attr_accessor :email
  validates :email, :email_address => true, :allow_nil => true
end

class EmailAddressValidatorTest < MiniTest::Test
  def setup
    @subject = WithEmail.new
  end

  def test_accepts_nil_email_address
    accept(nil)
  end

  def test_accepts_common_email_address_format
    accept("bob@example.com")
  end

  def test_rejects_email_address_without_at_sign
    reject("bobexample.com")
  end

  def test_accepts_hostname_with_dashes
    accept("my@do-main.com")
  end

  def test_accepts_hostname_with_numbers
    accept("my@d0main42.com")
  end

  def test_accepts_hostname_with_only_numbers
    accept("iam@1337.com")
  end

  def test_accepts_hostname_with_multiple_parts
    accept("my@secure.email.domain.name")
  end

  def test_rejects_local_part_starting_with_dot
    reject(".my@domain.com")
  end

  def rejects_local_part_ending_with_dot
    reject("my.@domain.com")
  end

  def rejects_hostname_starting_with_dot
    reject("my@.domain.com")
  end

  def rejects_hostname_starting_with_space
    reject("my@ domain.com")
  end

  def rejects_hostname_ending_with_dot
    reject("my@domain.com.")
  end

  def rejects_domain_part_without_dot
    reject("my@domaindk")
  end

  def rejects_multiple_sequential_dots_in_local_part
    reject("my..nice@domain.com")
  end

  def rejects_multiple_sequential_dots_in_hostname
    reject("my@nice..domain.com")
  end

  def rejects_zero_at_signs
    reject("mydomain.com")
  end

  def rejects_multiple_at_signs
    reject("my@nice@domain.com")
  end

  def rejects_commas_in_hostname
    reject("my@domain.com,")
  end

  def handles_long_failing_strings
    reject("fernandeztorralbofrancisco@sabadellatlantico.")
  end

  private

  def accept(email_address)
    @subject.email = email_address
    assert @subject.valid?, "Expected #{email_address.inspect} to be valid"
  end

  def reject(email_address)
    @subject.email = email_address
    assert !@subject.valid?, "Expected #{email_address.inspect} to be invalid"
  end
end
