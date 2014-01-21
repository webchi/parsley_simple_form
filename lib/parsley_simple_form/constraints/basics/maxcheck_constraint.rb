module ParsleySimpleForm
  module Constraints
    module Basics
      class MaxcheckConstraint < Constraints::BaseConstraint

        def match?
          return false if @options.nil?
          !@options[:maxcheck].nil?
        end

        def html_attributes
          attributes = {
            :'data-parsley-maxcheck' => @options[:maxcheck],
            :'data-parsley-maxcheck-message' => I18n::translate('form_validation.message.maxcheck', maxcheck: @options[:maxcheck])
          }
          attributes.merge!({:'data-parsley-group' => @options[:check_group]}) unless @options[:check_group].nil?
          attributes
        end

      end
    end
  end
end
