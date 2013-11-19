module ParsleySimpleForm
  module Constraints
    module Basics
      class TypeConstraint < Constraints::BaseConstraint
        TYPES_CONSTRAINTS = %w(email url urlstrict digits number alphanum dateIso phone)

        TYPE_MAP = {
          'decimal' => 'number'
        }

        def match?
          TYPES_CONSTRAINTS.include?(type) or !TYPE_MAP[type].nil?
        end

        def html_attributes
          mapped_type = type
          mapped_type = TYPE_MAP[type] unless TYPE_MAP[type].nil?
          {"data-type-#{mapped_type}-message".to_sym => I18n::translate("form_validation.message.#{mapped_type}")}
        end

        private
        def type
          @type ||= @form_builder.find_input(@form_builder.attribute_name, @options, &@block).input_type.to_s
        end

      end
    end
  end
end
