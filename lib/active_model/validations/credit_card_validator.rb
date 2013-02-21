require 'active_model'

module ActiveModel

  module Validations

    class CreditCardValidator < ActiveModel::EachValidator

      def validate_each(record, attribute, value)
        unless CreditCardValidation::Validator.new(value).valid?
          record.errors[attribute] << (options[:message] || "is not a valid credit card")
        end
      end

    end

    module ClassMethods

      def validates_credit_card(*attributes)
        validates_with CreditCardValidator, _merge_attributes(*attributes)
      end

    end

  end

end
