module ParsleySimpleForm
  module Constraints
    module Basics
      class RangeConstraint < Constraints::BaseConstraint
        include Concerns::RangeConcern

        def match?
          !@options[:range].nil?
        end

        def html_attributes
          range = parse_range(@options[:range])
          {
            :'data-parsley-range' => range[:string],
            :'data-parsley-range-message' => I18n::translate('form_validation.message.range', min: range[:min], max: range[:max])
          }
        end
      end
    end
  end
end