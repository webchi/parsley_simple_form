module ParsleySimpleForm
  module Constraints
    module Basics
      class NotBlankConstraint < Constraints::BaseConstraint

        def match?
          !@options[:notblank].nil?
        end

        def html_attributes
          {:'data-parsley-notblank' => true}
        end

      end
    end
  end
end