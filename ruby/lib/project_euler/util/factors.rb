module ProjectEuler
  module Util
    class Factors
      attr_accessor :number
      def initialize(options={})
        self.number = options[:number].to_i
        self.number = 0 if self.number < 0
      end
      def factors
        factors = []
        return factors if self.number <= 0
        
        factors << 1
        factors << self.number
        
        max_to_test = self.number
        found_one = true
        while found_one
          found_one = false
          for i in 2..Math::sqrt(max_to_test).to_i
            if ( max_to_test % i == 0 )
              factors << i
              max_to_test = (max_to_test/i)
              factors << max_to_test
              found_one = true
              break
            end
          end
        end
        factors.uniq.sort
      end
      def is_prime?
        factors.length < 3
      end
    end
  end
end
