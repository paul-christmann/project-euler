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
        for i in 1..Math::sqrt(self.number).to_i
          if ( number % i == 0 )
            factors << i
            factors << (number / i)
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
