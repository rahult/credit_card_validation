require "credit_card_validation/version"

module CreditCardValidation

  CARD_TYPES = {
    "AMEX" => /^3[47][0-9]{13}$/,
    "Discover" => /^6011[0-9]{12}$/,
    "MasterCard" => /^5[1-5][0-9]{14}$/,
    "VISA" => /^4[0-9]{12}(?:[0-9]{3})?$/
  }

  class Validator
    attr_accessor :card

    def type
      CARD_TYPES.each do |key, value|
        return key if card =~ value
      end
      "Unkown"
    end

    def valid?
      type != "Unkown"
    end
  end
end
