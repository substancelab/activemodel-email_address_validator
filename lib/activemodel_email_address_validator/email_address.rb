module ActiveModelEmailAddressValidator
  class EmailAddress
    def initialize(address)
      @address = address.to_s
    end

    def to_s
      address
    end

    def valid?(regex = nil)
      if regex
        valid_using_regex?(regex)
      else
        valid_using_default?
      end
    end

    private

    attr_reader :address

    def valid_using_regex?(regex)
      address.to_s =~ regex
    end

    def valid_using_default?
      return false if address =~ /\s+/
      email_parts = address.split("@")

      return false unless email_parts.size == 2

      user, host = *email_parts
      return false unless user =~ /^([^.]+\S)*[^. ]+$/
      return false unless host =~ /^([^,. ~]+\.)+[^,. ]+$/
      true
    end
  end
end
