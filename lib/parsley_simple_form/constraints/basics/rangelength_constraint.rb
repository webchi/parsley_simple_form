module ParsleySimpleForm
  module Constraints
    module Basics
      class RangeLengthConstraint < Constraints::BaseConstraint

        def match?
          !@options[:rangelength].nil?
        end

        def html_attributes
          range = parse_range(@options[:rangelength])
          {
            :'data-rangelength' => range[:string],
            :'data-rangelength-message' => I18n::translate('form_validation.message.rangelength', min: range[:min], max: range[:max])
          }
        end

        private
        def parse_range(range)
          { 
            :string => range_to_string(range),
            :min => min_range(range),
            :max => max_range(range)
          }
        end

        def range_to_string(range)
          return "[#{range.min},#{range.max}]" if range.is_a?(Range)
          range
        end

        def min_range(range)
          return range.min if range.is_a?(Range)
          range.match(/\[(\d),(\d)\]/)[1]
        end

        def max_range(range)
          return range.max if range.is_a?(Range)
          range.match(/\[(\d),(\d)\]/)[2]
        end

      end
    end
  end
end