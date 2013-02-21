require 'spec_helper'

class CreditCard < ActiveRecord::Base
  validates :card_number, presence: true, credit_card: true
end

describe ActiveModel::Validations::CreditCardValidator do
  before do
    @credit_card = CreditCardValidation::Validator.new
  end

  describe "when asked about validity of a AMEX card" do
    it "should respond true for a valid card" do
      @credit_card.card = "378282246310005"
      @credit_card.must_be :valid?
    end

    it "should respond false for a invalid card" do
      @credit_card.card = "37828224631000"
      @credit_card.wont_be :valid?
    end
  end

  describe "when asked about validity of a Discover card" do
    it "should respond true for a valid card" do
      @credit_card.card = "6011111111111117"
      @credit_card.must_be :valid?
    end

    it "should respond false for a invalid card" do
      @credit_card.card = "601111111111111"
      @credit_card.wont_be :valid?
    end
  end

  describe "when asked about validity of a MasterCard card" do
    it "should respond true for a valid card" do
      @credit_card.card = "5105105105105100"
      @credit_card.must_be :valid?
    end

    it "should respond false for a invalid card" do
      @credit_card.card = "5105105105105106"
      @credit_card.wont_be :valid?
    end

    it "should respond false for a invalid card" do
      @credit_card.card = "510510510510510"
      @credit_card.wont_be :valid?
    end
  end

  describe "when asked about validity of a VISA card" do
    it "should respond true for a valid card" do
      @credit_card.card = "4111111111111111"
      @credit_card.must_be :valid?
    end

    it "should respond true for a valid card" do
      @credit_card.card = "4012888888881881"
      @credit_card.must_be :valid?
    end

    it "should respond false for a invalid card" do
      @credit_card.card = "4111111111111"
      @credit_card.wont_be :valid?
    end
  end

  describe "when asked about validity of a Unkown card" do
    it "should respond false for a invalid card" do
      @credit_card.card = "9111111111111111"
      @credit_card.wont_be :valid?
    end
  end
end
