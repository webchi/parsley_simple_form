module ParsleySimpleForm
  module Constraints
    module Basics
      class RangecheckConstraint < Constraints::BaseConstraint
        include Concerns::RangeConcern

        def match?
          return false if @options.nil?
          !@options[:rangecheck].nil?
        end

        def html_attributes
          range = parse_range(@options[:rangecheck])
          attributes = {
            :'parsley-rangecheck' => range[:string],
            :'parsley-rangecheck-message' => I18n::translate('form_validation.message.ragecheck', min: range[:min], max: range[:max])
          }
          attributes.merge!({:'parsley-group' => @options[:check_group]}) unless @options[:check_group].nil?
          attributes
        end

      end
    end
  end
end
