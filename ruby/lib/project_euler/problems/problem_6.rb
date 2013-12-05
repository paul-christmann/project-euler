include ProjectEuler::Util

module ProjectEuler
  module Problems
    class ProblemSix
      
      def initialize (number)
        @number = number
      end

      def difference
        sum = [*1..@number].inject(:+)
        sum_squared = sum*sum
        sum_of_squares = [*1..@number].inject(0){|result, element| result = result + element*element}
        sum_squared - sum_of_squares
      end
    end
  end
end
