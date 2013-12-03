module ProjectEuler
  module Util
    module Multiples
      
      def multiples(maximum, options = {})
        include_maximum = options[:include_maximum]
        multiples = []
        next_multiple = number
        while ((include_maximum && next_multiple <= maximum) || (!include_maximum && next_multiple < maximum) )
          multiples << next_multiple
          next_multiple += number
        end
        multiples
      end
    end
  end
end