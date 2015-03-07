require 'minitest_helper'
require 'active_model'

# Create a class we can validate with
class WithEmail
  include ActiveModel::Validations
  attr_accessor :email
  validates :email, :email_address => true, :allow_nil => true
end

class WorkEmail
  include ActiveModel::Validations
  attr_accessor :work_email
  validates :work_email, :email_address => true
end

class EmailAddressValidatorTest < MiniTest::Test
  def setup
    @subject = WithEmail.new
  end

  def test_accepts_nil_email_address
    accept(nil)
  end

  def test_accepts_valid_email_address
    accept("bob@example.com")
  end

  def test_rejects_invalid_email_address
    reject("bobexample.com")
  end

  def test_adds_errors_to_validated_attribute
    subject = WorkEmail.new
    subject.work_email = "whatever"
    subject.valid?
    assert subject.errors[:email].empty?
    assert !subject.errors[:work_email].empty?
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
