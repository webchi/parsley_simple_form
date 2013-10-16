require 'simple_form'

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

    def find_input(*args)
      super(*args)
    end

    private
    def i18n_messages
      message = {}
      message.merge! message_by_type
      message.merge! message_required 
      message.merge! message_equalto
    end

    def message_by_type
      type = find_input(@attribute_name, @options, &@block).input_type.to_s
      {"data-type-#{type}-message".to_sym => I18n::translate("form_validation.message.#{type}")}
    end

    def message_required
      required = Constraints::Basics::RequiredConstraint.new(self,@options,&@block)
      return required.html_attributes if required.match?
      {}
    end

    #f.input :password_confirm, :equalto => :password
    def message_equalto
      equalto = Constraints::Basics::EqualtoConstraint.new(self,@options,&@block)
      return equalto.html_attributes if equalto.match?
      {}
    end
  end
end