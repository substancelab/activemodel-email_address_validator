require "active_model/validator"

class EmailAddressValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    email_parts = value.split("@")

    unless email_parts.size == 2
      invalidate(record, attribute)
      return
    end

    user, host = *email_parts

    unless user =~ /^([^.]+\S)*[^.]+$/
      invalidate(record, attribute)
      return
    end

    unless host =~ /^([^(\,|.) ]+\.)+[^(\,|.) ]+$/
      invalidate(record, attribute)
      return
    end
  end

  private

  def invalidate(record, attribute)
    record.errors.add(attribute, :invalid)
  end
end
