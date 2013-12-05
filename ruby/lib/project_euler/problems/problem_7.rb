include ProjectEuler::Util

module ProjectEuler
  module Problems
    class ProblemSeven
      
      def initialize (count)
        @count = count
      end

      def primes
        Number.new(@count).primes(Primes::COUNT)
      end

    end
  end
end
