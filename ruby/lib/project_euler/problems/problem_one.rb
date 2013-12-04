require 'project_euler/util/multiples'
include ProjectEuler::Util
module ProjectEuler
  module Problems
    class ProblemOne
      def initialize (number1, number2, maximum)
        @maximum = maximum
        @n1 = Number.new(number1)
        @n2 = Number.new(number2)
      end
      def sum
        (@n1.multiples(@maximum) + @n2.multiples(@maximum)).sort.uniq.inject(:+)
      end
    end
  end
end