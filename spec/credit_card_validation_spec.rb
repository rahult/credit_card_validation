require 'spec_helper'

describe CreditCardValidation do
  before do
    @validator = CreditCardValidation::Validator.new
  end

  describe "when asked about validity of a AMEX card" do
    it "should respond true for a valid card" do
      @validator.card = "378282246310005"
      @validator.must_be :valid?
    end

    it "should respond false for a invalid card" do
      @validator.card = "37828224631000"
      @validator.wont_be :valid?
    end
  end

  describe "when asked about validity of a Discover card" do
    it "should respond true for a valid card" do
      @validator.card = "6011111111111117"
      @validator.must_be :valid?
    end

    it "should respond false for a invalid card" do
      @validator.card = "601111111111111"
      @validator.wont_be :valid?
    end
  end

  describe "when asked about validity of a MasterCard card" do
    it "should respond true for a valid card" do
      @validator.card = "5105105105105100"
      @validator.must_be :valid?
    end

    it "should respond false for a invalid card" do
      @validator.card = "510510510510510"
      @validator.wont_be :valid?
    end
  end

  describe "when asked about validity of a VISA card" do
    it "should respond true for a valid card" do
      @validator.card = "4111111111111111"
      @validator.must_be :valid?
    end

    it "should respond true for a valid card" do
      @validator.card = "4012888888881881"
      @validator.must_be :valid?
    end

    it "should respond false for a invalid card" do
      @validator.card = "411111111111"
      @validator.wont_be :valid?
    end
  end

  describe "when asked about validity of a Unkown card" do
    it "should respond false for a invalid card" do
      @validator.card = "9111111111111111"
      @validator.wont_be :valid?
    end
  end
end
