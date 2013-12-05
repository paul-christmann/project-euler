module ProjectEuler
  module Problems
    class Problem12
      
      def initialize (n_factors)
        @n_factors = n_factors
      end
      
      def first_triangle(starting_hint = 1)

        counter = 1
        triangle = 1
        while true
          factors = Number.new(triangle).factors
          return triangle if factors.size >= @n_factors 
          counter += 1
          triangle += counter
          break if counter > 76576501
        end
        # increment = hint
        # while largest.factors.size < @n_factors
        #   triangles = Number.new(increment).triangles
        #   increment *= 2
        #   largest = Number.new(triangles.last)
        # end
        # 
        # triangles.each do |i|
        #   factors = Number.new(i).factors
        #   return i if factors.size >= @n_factors 
        # end
        return 0
      end
      
    end
  end
end
