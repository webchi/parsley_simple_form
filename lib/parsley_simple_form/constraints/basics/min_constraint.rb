module ParsleySimpleForm
  module Constraints
    module Basics
      class MinConstraint < Constraints::BaseConstraint
        include Concerns::TypeSensitiveConcern

        def match?
          return false if @options.nil?
          @min = @options[:min]

          @input_html = @options[:input_html]
          !@options[:min].nil? || (!@input_html[:min].nil? && mapped_type == 'number')
        end

        def html_attributes
          attributes = {:'data-min-message' => I18n::translate('form_validation.message.min', min: @min)}
          attributes.merge({:type => 'number', :min => @min}) if (@input_html[:min].nil? || !mapped_type == 'number')
        end
      end
    end
  end
end