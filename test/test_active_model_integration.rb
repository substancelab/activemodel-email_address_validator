require "minitest_helper"
require "active_model"

SIMPLEST_VALIDATION = {:email => {:email_address => true}}
def build_model_with_validations(validations = SIMPLEST_VALIDATION)
  klass = Class.new do
    include ActiveModel::Validations
    def self.model_name
      ActiveModel::Name.new(self, nil, "ValidatorModel")
    end

    validations.each do |attribute, options|
      attr_accessor attribute
      validates attribute, options
    end
  end
  klass.new
end

class EmailAddressValidatorTest < MiniTest::Test
  def setup
    @subject = build_model_with_validations
  end

  def test_accepts_nil_email_address
    @subject = build_model_with_validations(
      :email => {:email_address => true, :allow_nil => true}
    )
    accept(nil)
  end

  def test_accepts_valid_email_address
    accept("bob@example.com")
  end

  def test_rejects_invalid_email_address
    reject("bobexample.com")
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
    subject.email = "whatever@enterprise.museum"
    assert subject.valid?
    subject.email = "totally@valid.com"
    assert !subject.valid?
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
