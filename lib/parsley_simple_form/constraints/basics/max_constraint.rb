module ParsleySimpleForm
  module Constraints
    module Basics
      class MaxConstraint < Constraints::BaseConstraint
        include Concerns::TypeSensitiveConcern

        def match?
          return false if @options.nil?
          @input_html = @options[:input_html]
          @max = @options[:max] || @input_html[:max]
          !@options[:max].nil? || (!@input_html[:max].nil? && mapped_type.to_s == 'number')
        end

        def html_attributes
          attributes = {:'data-parsley-max-message' => I18n::translate('form_validation.message.max', max: @max)}
          attributes.merge!({:type => 'number', :max => @max}) if (@input_html[:max].nil? || !mapped_type.to_s == 'number')
          attributes
        end

      end
    end
  end
end