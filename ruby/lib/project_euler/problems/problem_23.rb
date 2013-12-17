module ProjectEuler
  module Problems
    class Problem23
      def initialize
        @abundant_sums = {}

        abundants = []
        (1..28123).each do |i|
          if Number.new(i).is_abundant?
            abundants << i 
            (0..abundants.size-1).each do |j|
              @abundant_sums[i+abundants[j]] = true
            end
          end
        end
      end
      
      def abundant_sums
        @abundant_sums.keys.sort
      end
      
      def non_abundant_sums
        result = []
        (1..28123).each do |i|
          result << i unless @abundant_sums[i]
        end
        result
      end
    end
  end
end
