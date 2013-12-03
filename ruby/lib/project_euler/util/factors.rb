module ProjectEuler
  module Util
    module Factors
      
      def factors
        factors = []
        return factors if self.number <= 0
        
        factors << 1
        factors << self.number
        
        number_to_factor = self.number
        while factor = find_factor(number_to_factor)
          factors << factor
          factors << (number_to_factor = (number_to_factor/factor))
        end
        factors.uniq.sort
      end
      
      def is_prime?
        factors.length < 3
      end
      
      protected
      def find_factor(n)
        for i in 2..Math::sqrt(n).to_i
          return i if n % i == 0
        end
        nil
      end
    end
  end
end
