module ActiveModelEmailAddressValidator
  class EmailAddress
    def initialize(address)
      @address = address
    end

    def to_s
      address.to_s
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
      email_parts = address.split('@')

      return false unless email_parts.size == 2

      user, host = *email_parts
      return false unless user =~ /^([^.]+\S)*[^. ]+$/
      return false unless host =~ /^([^,. ]+\.)+[^,. ]+$/
      return true
    end
  end
end
