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

    def valid_host?(host)
      /^([^,. ~]+\.)+[^,. ]+$/.match?(host)
    end

    def valid_user?(user)
      /^([^.]+\S)*[^. ]+$/.match?(user)
    end

    def valid_using_regex?(regex)
      address.to_s =~ regex
    end

    def valid_using_default?
      return false if /\s+/.match?(address)
      email_parts = address.split("@", -1)

      return false unless email_parts.size == 2

      user, host = *email_parts
      valid_user?(user) && valid_host?(host)
    end
  end
end
