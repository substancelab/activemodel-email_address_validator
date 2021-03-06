require "active_model/validator"
require "activemodel_email_address_validator/email_address"

class EmailAddressValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    rules = Array(options[:with] || [])
    if rules.empty?
      # We are using the old syntax, assume regular expressions
      rules = [build_rule_from_format(options[:format])]
    end

    invalidate(record, attribute) unless all_rules_pass?(rules, value)
  end

  private

  def all_rules_pass?(rules, address)
    evaluators = rules.map { |rule| build_evaluator(rule) }
    results = evaluators.map { |evaluator| evaluator.call(address) }
    results.all?
  end

  # Returns an evaluator for the given rule. Evaluators are objects that respond
  # to `#call` with an arity of 1; the raw attribute value in question.
  #
  # The return-value of `#call` should be `true` if the address passes the given
  # rule, false otherwise.
  def build_evaluator(rule)
    case rule
    when Regexp
      proc { |a| a =~ rule }
    else
      rule
    end
  end

  def build_rule_from_format(format)
    proc { |attribute_value|
      address =
        ActiveModelEmailAddressValidator::EmailAddress.new(attribute_value)
      address.valid?(format)
    }
  end

  def invalidate(record, attribute)
    record.errors.add(attribute, :invalid)
  end
end
