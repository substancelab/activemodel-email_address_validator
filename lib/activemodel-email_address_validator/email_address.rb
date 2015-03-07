module ActiveModelEmailAddressValidator
  class EmailAddress
    def initialize(address)
      @address = address
    end

    def to_s
      address.to_s
    end

    def valid?
      return false if address.nil?
      address =~ DEFAULT_VALID_EMAIL_PATTERN
    end

    private

    attr_reader :address
  end
end
