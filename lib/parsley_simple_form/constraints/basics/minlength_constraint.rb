module ParsleySimpleForm
  module Constraints
    module Basics
      class MinLengthConstraint < Constraints::BaseConstraint

        def match?
          !@options[:minlength].nil?
        end

        def html_attributes
          {
            :'data-parsley-minlength' => @options[:minlength],
            :'data-parsley-minlength-message' => I18n::translate('form_validation.message.minlength', minlength: @options[:minlength])
          }
        end

      end
    end
  end
end