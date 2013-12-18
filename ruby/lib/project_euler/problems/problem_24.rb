module ProjectEuler
  module Problems
    class Problem24
      def initialize(digits = 10)
        @num_digits = [1,[10,digits.to_i].min].max
      end
      
      def base_sequence
        [*0..@num_digits-1].inject("") { |s,d| "#{s}#{d}"}
      end
      
      def permutation(count)
        return "" if count >= factorial(@num_digits)
        
        result = ""
        base = [*0..@num_digits-1]
        while (base.size > 0)
          num_possible = factorial(base.size-1)
          index = count / num_possible
          count = count % num_possible
          
          result = "#{result}#{base[index]}"
          base.delete_at(index)
        end
        result
      end
      
      protected
      def factorial(n)
        return ( n <= 1 ? 1 : n * factorial(n-1) )
      end
    end
  end
end
