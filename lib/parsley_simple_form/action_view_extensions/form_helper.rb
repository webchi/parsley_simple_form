module ParsleySimpleForm
  module ActionViewExtensions
    module FormHelper
      def parsley_form_for(object, *args, &block)
        options = args.extract_options!
        options[:builder] = ParsleySimpleForm::FormBuilder
        options[:html] = {} if options[:html].nil?
        #options[:html][:"data-validate"] = "parsley"
        #options[:html][:novalidate] = true
        options[:html][:'data-parsley-validate'] = true
        options[:html][:'data-parsley-namespace'] = "data-parsley-" #to HTML5 valid
        simple_form_for(object, *(args << options), &block)
      end
    end
  end
end