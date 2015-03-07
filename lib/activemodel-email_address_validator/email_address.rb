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

      email_parts = address.split("@")
      return false unless email_parts.size == 2

      user, host = *email_parts
      return false unless user =~ /^([^.]+\S)*[^.]+$/
      return false unless host =~ /^([^(\,|.) ]+\.)+[^(\,|.) ]+$/
      return true
    end

    private

    attr_reader :address
  end
end
