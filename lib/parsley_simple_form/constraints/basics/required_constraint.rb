module ParsleySimpleForm
  module Constraints
    module Basics
      class RequiredConstraint < Constraints::BaseConstraint

        #Check for this attributes:
        #data-required="true", class="required" or required="required"
        def match?
          return false if @options.nil?

          input_html = @options[:input_html]
          !input_html.nil? && (!input_html[:required].nil? || !input_html[:'data-required'].nil? || 
            (!input_html[:class].nil? && input_html[:class].include?('required')) || !@options[:required].nil?) 
      
        end

        def html_attributes
          {"data-required-message".to_sym => I18n::translate('form_validation.message.required')}
        end

      end
    end
  end
end