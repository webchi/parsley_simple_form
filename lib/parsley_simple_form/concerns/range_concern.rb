module ParsleySimpleForm
  module Concerns
    module RangeConcern
      private
        def parse_range(range)
          { 
            :string => range_to_string(range),
            :min => min_range(range),
            :max => max_range(range)
          }
        end

        def range_to_string(range)
          return "[#{range.min},#{range.max}]" if range.is_a?(Range)
          range
        end

        def min_range(range)
          return range.min if range.is_a?(Range)
          range.match(/\[(\d),(\d)\]/)[1]
        end

        def max_range(range)
          return range.max if range.is_a?(Range)
          range.match(/\[(\d),(\d)\]/)[2]
        end
    end
  end
end
