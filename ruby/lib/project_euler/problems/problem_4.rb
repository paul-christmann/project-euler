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
        palindromes(true).last
      end
      def palindromes(max_only = false)
        palindromes = []
        for i in 0..max_number-1 do
          d1 = self.max_number - i
          for j in 0..max_number-1 do
            d2 = self.max_number - j
            factor = d1 * d2
            if ProblemFour.is_palindrome?(factor)
              palindromes << factor
              palindromes = palindromes.uniq.sort
              break if max_only && ((palindromes.last / d2) > self.max_number)
            end
          end
          break if max_only && ((palindromes.last / d1) > self.max_number)
        end
        palindromes
      end
      def self.is_palindrome?(n)
        n  == n.to_s.reverse.to_i
      end
    end
  end
end