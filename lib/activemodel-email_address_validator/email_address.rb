module ActiveModelEmailAddressValidator
  class EmailAddress
    def initialize(address)
      @address = address
    end

    def to_s
      address.to_s
    end

    def valid?(regex = DEFAULT_VALID_EMAIL_PATTERN)
      return false if address.nil?
      address =~ regex
    end

    private

    attr_reader :address
  end
end
