
module ProjectEuler
  module Problems
    class ProblemFive
      def initialize (number_range)
        @numbers = []
        [*number_range.min..number_range.max].reverse.each do |i|
          @numbers << i unless @numbers.detect{|n| n%i == 0}
        end
      end
      
      def smallest_multiple
        overall_primes = {}
        @numbers.each do |n|
          Number.new(n).prime_factors.each do |factor, quantity|
            overall_primes[factor] = [overall_primes[factor].to_i, quantity].max
          end
        end

        result = 1
        overall_primes.each do |factor, quantity|
          for i in 1..quantity do
            result *= factor
          end
        end
        result
      end
    end
  end
end