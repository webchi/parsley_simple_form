require 'simple_form'

module ParsleySimpleForm
  class FormBuilder < SimpleForm::FormBuilder    
    attr_reader :attribute_name

   

    def input(attribute_name, options = {}, &block)
      @attribute_name = attribute_name
      @options = options
      @block = block
      @options[:input_html] ||= {} 
      @options[:input_html].merge! parsley_html
      super(@attribute_name, @options, &@block)
    end

    def find_input(*args)
      super(*args)
    end

    private
    def parsley_html
      message = {}     

      basic_constraints.each do |constraint|
        message.merge! check_constraint(constraint)
      end
      message
    end

    def check_constraint(constraint)
      constraint_checker = constraint.new(self,@options,&@block)
      return constraint_checker.html_attributes if constraint_checker.match?
      {}
    end

    def basic_constraints
      #dinamically load all classes of Constraints::Basics module
      Constraints::Basics.constants
        .select { |c| Constraints::Basics.const_get(c).is_a?(Class) }
        .map { |c| Constraints::Basics.const_get(c) }
    end

  end
end