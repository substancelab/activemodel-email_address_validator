require "coveralls"
Coveralls.wear!

$LOAD_PATH.unshift File.expand_path("../../lib", __FILE__)
require "activemodel-email_address_validator"

require "minitest/autorun"
require "minitest/spec"

SIMPLEST_VALIDATION = {:email => {:email_address => true}}

# rubocop:disable Metrics/MethodLength
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
# rubocop:enable Metrics/MethodLength
