module ParsleySimpleForm
  module Constraints
    module Basics
      class RegexpConstraint < Constraints::BaseConstraint
        def match?
          return false if @options.nil?
          
          if @options[:regexp].nil?
            @regexp = @options[:input_html][:regexp] unless @options[:input_html].nil?
          else
            @regexp = @options[:regexp]
          end
          !@regexp.nil?
        end

        def html_attributes
          {:'data-regexp-message' => I18n::translate('form_validation.message.regexp'),
            :pattern => @regexp}
        end
      end
    end
  end
end