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

    def initialize(card=nil)
      sanitize(card)
    end

    def sanitize(card)
      self.card = card.gsub(" ", "") unless self.card.nil?
    end

    def type
      sanitize(card)
      CARD_TYPES.each do |key, value|
        return key if sanitize(card) =~ value
      end
      "Unkown"
    end

    def valid?
      type != "Unkown"
    end

    def validity
      valid? ? "valid" : "invalid"
    end

    def to_s
      "#{type}: #{card}".ljust(28) + " (#{validity})"
    end
  end
end

if __FILE__==$0
  cards = "4111111111111111
           4111111111111
           4012888888881881
           378282246310005
           6011111111111117
           5105105105105100
           5105 1051 0510 5106
           9111111111111111"

  validator = CreditCardValidation::Validator.new

  cards.lines.each do |line|
    validator.card = line.chomp.strip
    validator.valid?
    puts validator
  end
end
