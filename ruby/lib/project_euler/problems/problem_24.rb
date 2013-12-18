module ProjectEuler
  module Problems
    class Problem24
      def initialize(digits = 10)
        @num_digits = [1,[10,digits.to_i].min].max
      end
      
      def permutation(count)
        base = [*0..@num_digits-1]
        do_permutations(base, count)
      end
      
      def do_permutations(base, count)
        result = ""
        if base.length > 0 && count < factorial(base.length)
          num_possible = factorial(base.size-1)
          index = count / num_possible
          count = count % num_possible
          c = base.delete_at(index)
          result = "#{c}#{do_permutations(base, count)}"
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
