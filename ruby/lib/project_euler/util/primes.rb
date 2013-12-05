module ProjectEuler
  module Util
    module Primes
      
      MAX_VALUE = 0
      COUNT = 1
      def primes(type)
        return [] if self.number <= 0
        type == MAX_VALUE ? Primes.do_prime_sieve(self.number) : primes1
      end
      
      protected
      
      def primes1
        primes = []
        increment = 10*self.number
        while (primes = Primes.do_prime_sieve(increment)).size < self.number
          increment += increment
        end
        primes.slice(0,self.number)
      end

      def Primes.do_prime_sieve(end_val)
        
        primes = []
        non_prime_hash = {}
        
        prime_candidate = 2
        while true
          unless non_prime_hash[prime_candidate]
            primes << prime_candidate
            p = prime_candidate
            while p < end_val
              non_prime_hash[p] = true
              p = p+prime_candidate
            end
          end
          prime_candidate = prime_candidate + 1
          break if prime_candidate >= end_val
        end
        primes
      end
      

    end
  end
end
