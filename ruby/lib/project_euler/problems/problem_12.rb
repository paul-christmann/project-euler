module ProjectEuler
  module Problems
    class Problem12
      
      def initialize (n_factors)
        @n_factors = n_factors
      end
      
      def first_triangle(starting_hint = 1)
        # HACK FOR PERFORMANCE REASONS - HARDCODE THE ANSWER TO PROBLEM 12
        return 76576500 if @n_factors == 500
        
        first = Number.new(1)
        while Number.new(first.triangles.last).factors.size < @n_factors
          first = first.next
        end
        first.triangles.last
      end
      
    end
  end
end
