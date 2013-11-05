module ParsleySimpleForm
  module Constraints
    module Basics
      class TypeConstraint < Constraints::BaseConstraint
        TYPES_CONSTRAINTS = %w(email url urlstrict digits number alphanum dateIso phone)

        TYPE_MAP = {
          'decimal' => 'number'
        }

        def match?
          TYPES_CONSTRAINTS.include?(type)
        end

        def html_attributes
          type = TYPE_MAP[type] unless TYPE_MAP[type].nil?
          {"data-type-#{type}-message".to_sym => I18n::translate("form_validation.message.#{type}")}
        end

        private
        def type
          @type ||= @form_builder.find_input(@form_builder.attribute_name, @options, &@block).input_type.to_s
        end

      end
    end
  end
end
