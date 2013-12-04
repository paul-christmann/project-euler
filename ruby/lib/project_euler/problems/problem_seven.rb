include ProjectEuler::Util

module ProjectEuler
  module Problems
    class ProblemSeven
      
      def initialize (number)
        @number = number
      end

      def primes
        return [] if @number <= 0
        primes2
      end

      protected
      def primes1
        primes = []
        return primes if @number <= 0
        
        prime_candidate = 2
        while true
          primes << prime_candidate unless primes.detect{|p| prime_candidate % p == 0}
          break if primes.size == @number
          prime_candidate = prime_candidate + 1
        end
        primes
      end
      
      def primes2
        primes = []
        last_prime = 1
        while prime_candidate = next_prime(last_prime)
          primes << prime_candidate
          break if primes.size == @number
          last_prime = prime_candidate
        end
        primes
      end
      
      def next_prime(i)
        while true
          i = i+1
          return i if Number.new(i).is_prime?
        end
      end
    end
  end
end
