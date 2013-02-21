require 'active_model'

module ActiveModel

  module Validations

    class CreditCardValidator < ActiveModel::EachValidator

      def validate_each(record, attribute, value)
        if !value.blank? && !CreditCardValidation::Validator.new(value).valid?
          record.errors.add(attribute, options[:message] || "is not a valid credit card")
        end
      end

    end

    module HelperMethods
      # Validates whether the value of the specified attribute is a validate Credit Card
      #
      #   class Order < ActiveRecord::Base
      #     validates_credit_card :card_number
      #   end
      #
      def validates_credit_card(*attr_names)
        validates_with CreditCardValidator, _merge_attributes(attr_names)
      end
    end

  end

end
