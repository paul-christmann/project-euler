module ProjectEuler
  module Problems
    class Problem21
      def initialize(max)
        @max = max
      end
      
      def amicables
        @amicable_sums = {}
        @amicable_pairs = []
        (1..@max).each do |i|
          amicable_sum = Number.new(i).amicable_sum
          if @amicable_sums[amicable_sum] == i
            @amicable_pairs << [amicable_sum, i]
          end
          @amicable_sums[i] = amicable_sum
        end
        @amicable_pairs
      end
      
      def amicables_sum
        result = 0
        amicables.each do |pair|
          result = result + pair[0] + pair[1]
        end
        result
      end
    end
  end
end
