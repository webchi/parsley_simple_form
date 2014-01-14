module ParsleySimpleForm
  module Constraints
    module Basics
      class RangeLengthConstraint < Constraints::BaseConstraint
        include Concerns::RangeConcern

        def match?
          !@options[:rangelength].nil?
        end

        def html_attributes
          range = parse_range(@options[:rangelength])
          {
            :'parsley-rangelength' => range[:string],
            :'data-rangelength-message' => I18n::translate('form_validation.message.rangelength', min: range[:min], max: range[:max])
          }
        end
      end
    end
  end
end