require "active_model/validator"
require "activemodel-email_address_validator/email_address"

class EmailAddressValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    address = ActiveModelEmailAddressValidator::EmailAddress.new(value)
    invalidate(record, attribute) unless address.valid?
  end

  private

  def invalidate(record, attribute)
    record.errors.add(attribute, :invalid)
  end
end
