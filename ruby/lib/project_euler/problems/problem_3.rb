include ProjectEuler::Util
module ProjectEuler
  module Problems
    class ProblemThree
      def initialize (number)
        @f = Number.new(number)
      end
      def largest_prime
        @f.factors.reverse.each do |factor|
          return factor if Number.new(factor).is_prime?
        end
        nil
      end
    end
  end
end