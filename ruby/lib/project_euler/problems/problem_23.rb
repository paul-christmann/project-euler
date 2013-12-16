module ProjectEuler
  module Problems
    class Problem23
      def initialize
        @abundants = {}
        @abundant_sums = {}
        (1..28123).each do |i|
          n = Number.new(i)
          if n.is_abundant?
            @abundants[i] = true 
          end
        end
        keys = @abundants.keys
        keys.each do |i|
          keys.each do |j|
            @abundant_sums[i + j] = true
          end
        end
      end
      
      def abundant_sums
        @abundant_sums
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
