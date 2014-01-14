module ParsleySimpleForm
  module Constraints
    module Basics
      class MaxLengthConstraint < Constraints::BaseConstraint

        def match?
          !@options[:maxlength].nil?
        end

        def html_attributes
          {
            :'data-maxlength' => @options[:maxlength],
            :'data-maxlength-message' => I18n::translate('form_validation.message.maxlength', maxlength: @options[:maxlength])
          }
        end

      end
    end
  end
end