module ParsleySimpleForm
  class FormBuilder < SimpleForm::FormBuilder
    def input(attribute_name, options = {}, &block)
      @attribute_name = attribute_name
      @options = options
      @block = block
      @options[:input_html] ||= {} 
      @options[:input_html].merge! i18n_messages
      super(@attribute_name, @options, &@block)
    end

    private
    def i18n_messages
      message = {}
      message.merge! message_by_type
      message.merge! message_required
      message.merge! message_equalto
    end

    def message_by_type
      type = input_type(@attribute_name, @options, &@block).to_s
      {"data-type-#{type}-message".to_sym => I18n::translate("form_validation.message.#{type}")}
    end

    def message_required
      input_html = @options[:input_html]
      if input_html.nil? && input_html[:required].nil? && input_html[:'data-required'].nil? && 
        input_html[:class].nil? && !input_html[:class].include?('required')
        {}
      else
        {"data-required-message".to_sym => I18n::translate('form_validation.message.required')}
      end
    end

    def message_equalto
      attr_equalto = @options[:equalto] or return {}
      input = find_input(attr_equalto, @options, &@block)
      {
        :'data-equalto' => '#' + input_id(attr_equalto, @options, &@block), 
        :'data-equalto-message' => 
          I18n::translate('form_validation.message.equalto', field_name: input.object.class.human_attribute_name(input.attribute_name))
      }
    end

    def input_type(attribute_name, options, &block)
      input = find_input(attribute_name, options, &block)
      input.input_type or :string
    end

    def input_id(attribute_name, options, &block)
      input = find_input(attribute_name, options, &block)
      (input.lookup_model_names * '_') + '_attributes_' + input.attribute_name.to_s
    end
  end
end