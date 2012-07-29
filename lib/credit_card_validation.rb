require "credit_card_validation/version"

module CreditCardValidation
  class Validator
    attr_accessor :card

    def initialize(card=nil)
      sanitize(card)
    end

    def sanitize(card)
      self.card = card.gsub(/\s/,'') unless card.nil?
    end

    def type
      case sanitize(card)
        when /^(34|37)\d{13}$/
          'AMEX'
        when /^6011\d{12}$/
          'Discover'
        when /^5[1-5]\d{14}$/
          'MasterCard'
        when /^4(\d{12}|\d{15})$/
          'VISA'
        else 'Unknown'
      end
    end

    def meet_luhn_verification
      total = sanitize(card).reverse.split(//).inject([0,0]) do |accum,number|
        number = number.to_i
        accum[0] += (accum[1] % 2 == 0 ? number : rotate(number * 2))
        accum[1] += 1
        accum
      end

      total[0] % 10 == 0
    end

    def rotate(number)
      if number > 9
        number = number % 10 + 1
      end
      number
    end

    def valid?
      (type != "Unkown") && meet_luhn_verification
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
