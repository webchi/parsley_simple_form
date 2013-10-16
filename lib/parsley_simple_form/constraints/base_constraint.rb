module ParsleySimpleForm
  module Constraints    
    class BaseConstraint

      def initialize(form_builder,options,&block)
        @form_builder = form_builder
        @options = options
        @block = block
      end

      def input_type(attribute_name, options, &block)
        input = @form_builder.find_input(attribute_name, options, &block)
        input.input_type or :string
      end

      def input_id(attribute_name, options, &block)
        input = @form_builder.find_input(attribute_name, options, &block)
        (input.lookup_model_names * '_') + '_attributes_' + input.attribute_name.to_s
      end
    end
  end
end