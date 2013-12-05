include ProjectEuler::Util

module ProjectEuler
  module Problems
    class ProblemSeven
      
      def initialize (count)
        @count = count
      end

      def primes
        Number.new(@count, :type => Primes::COUNT).primes
      end

    end
  end
end
