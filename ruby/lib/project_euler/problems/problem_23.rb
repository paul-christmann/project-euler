module ProjectEuler
  module Problems
    class Problem23
      def initialize
        @abundants = []
        @abundant_sums = {}
        (1..28123).each do |i|
          n = Number.new(i)
          if n.is_abundant?
            @abundants << i
          end
        end
        
        (0..@abundants.size-1).each do |i|
          x = @abundants[i]
          (0..i).each do |j|
            y = @abundants[j]
            @abundant_sums[x+y] = true
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
