include ProjectEuler::Util

module ProjectEuler
  module Problems
    class ProblemSeven
      
      def initialize (number)
        @number = number
      end

      def primes
        return [] if @number <= 0
        primes1
      end

      protected
      def primes1
        primes = []
        
        squares_hash = {}
        return primes if @number <= 0
        
        prime_candidate = 2
        while true
          sqr_candidate = Math.sqrt(prime_candidate).to_i
          prime_factor = primes.each.detect do |p|
            p <= sqr_candidate && prime_candidate % p == 0
          end
          primes << prime_candidate unless prime_factor
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
