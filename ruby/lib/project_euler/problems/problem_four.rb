module ProjectEuler
  module Problems
    class ProblemFour
      attr_accessor :max_number
      def initialize (max_digits)
        self.max_number = 1
        for i in 1..max_digits
          self.max_number *= 10
        end
        self.max_number -= 1
      end
      def largest_palindrome
        palindromes = []
        for i in 0..max_number do
          d1 = self.max_number - i
          for j in 0..max_number do
            d2 = self.max_number - j
            factor = d1 * d2
            palindromes << factor if ProblemFour.is_palindrome?(factor)
          end
        end
        palindromes.sort.last
      end
      def self.is_palindrome?(n)
        n  == n.to_s.reverse.to_i
      end
    end
  end
end