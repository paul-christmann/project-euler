module ProjectEuler
  module Util
    module Primes
      
      MAX_VALUE = 0
      COUNT = 1
      def primes(type)
        return [] if self.number <= 0
        type == COUNT ? primes1 : prime_sieve
      end
      
      def prime_sieve
        primes = []
        non_primes = {}
        
        prime_candidate = 2
        while true
          unless non_primes[prime_candidate]
            primes << prime_candidate
            p = prime_candidate
            while p < self.number
              non_primes[p] = true
              p = p+prime_candidate
            end
          end
          prime_candidate = prime_candidate + 1
          break if prime_candidate >= self.number
        end
        primes
      end
      
      def primes1
        primes = []
        
        squares_hash = {}
        return primes if self.number <= 0
        
        prime_candidate = 2
        while true
          sqr_candidate = Math.sqrt(prime_candidate).to_i
          prime_factor = primes.each.detect do |p|
            p <= sqr_candidate && prime_candidate % p == 0
          end
          primes << prime_candidate unless prime_factor
          break if primes.size == self.number
          prime_candidate = prime_candidate + 1
        end
        primes
      end
    end
  end
end
