module ProjectEuler
  module Util
    module Primes
      
      MAX_VALUE = 0
      COUNT = 1
      
      def primes
        return [] if self.number <= 0

        increment = (options[:type] == COUNT ? 10*self.number : self.number)
        primes = Primes.do_prime_sieve(increment)
        
        if ( options[:type] == COUNT ) 
          while primes.size < self.number
            increment += increment
            primes = Primes.do_prime_sieve(increment)
          end
          primes = primes.slice(0,self.number)
        end
        
        primes
      end
      
      protected
      
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
