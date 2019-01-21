require "minitest_helper"
require "active_model"

class EmailAddressValidatorTest < MiniTest::Test
  def setup
    @subject = build_model_with_validations
  end

  def test_accepts_nil_email_address
    @subject = build_model_with_validations(
      :email => {:email_address => true, :allow_nil => true}
    )
    accept(nil, @subject)
  end

  def test_accepts_valid_email_address
    accept("bob@example.com", @subject)
  end

  def test_rejects_invalid_email_address
    reject("bobexample.com", @subject)
  end

  def test_adds_errors_to_validated_attribute
    subject = build_model_with_validations(
      :work_email => {:email_address => true}
    )
    subject.work_email = "whatever"
    subject.valid?
    assert subject.errors[:email].empty?
    assert !subject.errors[:work_email].empty?
  end

  def test_validates_with_custom_regular_expression
    subject = build_model_with_validations(
      :email => {:email_address => {:format => /.+@enterprise\..+/}}
    )
    accept("whatever@enterprise.museum", subject)
    reject("totally@valid.com", subject)
  end

  def test_validates_with_custom_regular_as_a_rule
    subject = build_model_with_validations(
      :email => {:email_address => {:with => /.+@enterprise\..+/}}
    )
    accept("whatever@enterprise.museum", subject)
    reject("totally@valid.com", subject)
  end

  def test_validates_with_proc
    subject = build_model_with_validations(
      :email => {:email_address => {
        :with => proc { |address| address == "foo" }}
      }
    )
    accept("foo", subject)
    reject("foo@bar.com", subject)
  end

  def test_validates_with_multiple_procs
    subject = build_model_with_validations(
      :email => {:email_address => {
        :with => [
          proc { |address| address == "ada" },
          proc { |address| address.reverse == address }
        ]}
      }
    )
    accept("ada", subject)
    reject("bob", subject)
  end

  private

  def accept(email_address, subject)
    subject.email = email_address
    assert subject.valid?, "Expected #{email_address.inspect} to be valid"
  end

  def reject(email_address, subject)
    subject.email = email_address
    assert !subject.valid?, "Expected #{email_address.inspect} to be invalid"
  end
end
