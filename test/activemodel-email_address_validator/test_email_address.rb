require 'minitest_helper'

class EmailAddressTest < MiniTest::Test
  def test_accepts_common_email_address_format
    accept("bob@example.com")
  end

  def test_rejects_email_address_without_at_sign
    reject("bobexample.com")
  end

  def test_rejects_blank_string
    reject("")
  end

  def test_rejects_empty_string
    reject("   ")
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

  def test_accepts_local_part_with_dashes
    accept("super-bob@example.com")
  end

  def test_accepts_local_part_with_period
    accept("super.bob@example.com")
  end

  def test_accepts_local_part_with_plus
    accept("super+bob@example.com")
  end

  def test_rejects_local_part_starting_with_dot
    reject(".my@domain.com")
  end

  def test_rejects_local_part_with_spaces
    reject("f oo @domain.com")
  end

  def test_rejects_local_part_ending_with_dot
    reject("my.@domain.com")
  end

  def test_rejects_hostname_starting_with_dot
    reject("my@.domain.com")
  end

  def test_rejects_hostname_starting_with_space
    reject("my@ domain.com")
  end

  def test_rejects_hostname_ending_with_dot
    reject("my@domain.com.")
  end

  def test_rejects_domain_part_without_dot
    reject("my@domaindk")
  end

  def test_rejects_multiple_sequential_dots_in_local_part
    reject("my..nice@domain.com")
  end

  def test_rejects_multiple_sequential_dots_in_hostname
    reject("my@nice..domain.com")
  end

  def test_rejects_zero_at_signs
    reject("mydomain.com")
  end

  def test_rejects_multiple_at_signs
    reject("my@nice@domain.com")
  end

  def test_rejects_commas_in_hostname
    reject("my@domain.com,")
  end

  def test_handles_long_failing_strings
    reject("fernandeztorralbofrancisco@sabadellatlantico.")
  end

  private

  def accept(email_address)
    @subject = ActiveModelEmailAddressValidator::EmailAddress.new(email_address)
    assert @subject.valid?, "Expected #{email_address} to be valid"
  end

  def reject(email_address)
    @subject = ActiveModelEmailAddressValidator::EmailAddress.new(email_address)
    assert !@subject.valid?, "Expected #{email_address} to be invalid"
  end
end
