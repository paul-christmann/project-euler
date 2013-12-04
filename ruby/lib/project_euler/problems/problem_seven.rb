include ProjectEuler::Util

module ProjectEuler
  module Problems
    class ProblemSeven
      
      def initialize (number)
        @number = number
      end

      def primes
        primes = []
        return primes if @number <= 0
        
        last_prime = 1
        while prime = next_prime(last_prime)
          primes << prime
          break if primes.size == @number
          last_prime = prime
        end
        primes
      end
      
      protected
      def next_prime(i)
        while true
          i = i+1
          return i if Number.new(i).is_prime?
        end
      end
    end
  end
end
