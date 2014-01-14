module ParsleySimpleForm
  module Constraints
    module Basics
      class TypeConstraint < Constraints::BaseConstraint
        include Concerns::TypeSensitiveConcern

        def match?
          TYPES_CONSTRAINTS.include?(type) or !TYPE_MAP[type].nil?
        end

        def html_attributes
          attributes = {"data-type-#{mapped_type}-message".to_sym => I18n::translate("form_validation.message.#{mapped_type}")}
          attributes.merge!({"parsley-type" => mapped_type}) unless HTML_NATIVE_TYPES.include?(mapped_type)
          attributes
        end
      end
    end
  end
end
