module ParsleySimpleForm
  module Constraints
    module Basics
      class EqualtoConstraint < Constraints::BaseConstraint

        #check for :equalto option
        def match?
          !@options[:equalto].nil?
        end

        def html_attributes
          return {} if @options.nil? || @options[:equalto].nil?

          attr_equalto = @options[:equalto]      
          input = @form_builder.find_input(attr_equalto, @options, &@block)      
          {
            :'data-equalto' => '#' + input_id(attr_equalto, @options, &@block), 
            :'data-equalto-message' => 
              I18n::translate('form_validation.message.equalto', field_name: input.object.class.human_attribute_name(input.attribute_name))
          }
        end
      end
    end
  end
end