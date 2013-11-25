module ParsleySimpleForm
  module Concerns
    module TypeSensitiveConcern
      TYPES_CONSTRAINTS = %w(email url urlstrict digits number alphanum dateIso phone)

      TYPE_MAP = {
        'decimal' => 'number'
      }

      private
      def mapped_type
        if @mapped_type.nil?
          @mapped_type = type
          @mapped_type = TYPE_MAP[type] unless TYPE_MAP[type].nil?
        end
        @mapped_type
      end

      def type
        @type ||= @form_builder.find_input(@form_builder.attribute_name, @options, &@block).input_type.to_s
      end
    end
  end
end
