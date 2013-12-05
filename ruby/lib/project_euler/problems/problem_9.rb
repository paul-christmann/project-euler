module ProjectEuler
  module Problems
    class Problem9
      def initialize
      end
      # a+b+c = sum and a^2 + b^2 = c^2
      # return a*b*c
      def pythagorean_product(sum)
        (1..sum).each do |a|
          (a..sum).each do |b|
            (b..sum).each do |c|
              next unless a+b+c == sum
              next unless a*a + b*b == c*c
              return a*b*c
            end
          end
        end
        0
      end
    end
  end
end
