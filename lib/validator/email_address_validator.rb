require "active_model/validator"

class EmailAddressValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    email_address = value
    invalidate(record, attribute) unless email_address.include?("@")
  end

  private

  def invalidate(record, attribute)
    record.errors.add(attribute, :invalid)
  end
end
