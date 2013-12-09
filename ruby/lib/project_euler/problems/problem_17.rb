module ProjectEuler
  module Problems
    class Problem17
      
      def initialize (number)
        @number = number
      end
      
      def as_words
        
        raise "Unsupported Operation (max = 1000)" if @number > 1000

        thousands_part = hundreds_part = tens_part = ""

        n = @number
        if n >= 1000
          thousands_part = "One Thousand"
          n = n - 1000
        end
        
        hundreds = n / 100
        hundreds_part = "#{ONES[hundreds]} HUNDRED" if hundreds > 0
        
        n = n - (hundreds * 100)
        if n < 10
          tens_part = ONES[n] if ONES[n]
        elsif n < 20
          tens_part = TEENS[n] if TEENS[n]
        else
          tens = n / 10
          n = n - (tens * 10)
          tens_part = TENS[tens] if TENS[tens]
          tens_part = "#{tens_part} #{ONES[n]}" if n > 0
        end
        result = "#{thousands_part} #{hundreds_part}".strip
        result = "#{result} AND ".strip if result.length > 0 && tens_part.length > 0
        result = "#{result} #{tens_part}".strip
        result.upcase
      end
      
      def as_stripped_words
        as_words.gsub(/[- ]/,'')
      end
      
      ONES = {
        1 => "ONE",
        2 => "TWO",
        3 => "THREE",
        4 => "FOUR",
        5 => "FIVE",
        6 => "SIX",
        7 => "SEVEN",
        8 => "EIGHT",
        9 => "NINE"
      }
      
      TENS = {
        2 => "TWENTY",
        3 => "THIRTY",
        4 => "FORTY",
        5 => "FIFTY",
        6 => "SIXTY",
        7 => "SEVENTY",
        8 => "EIGHTY",
        9 => "NINETY",
      }
      
      TEENS = {
        10 => "TEN",
        11 => "ELEVEN",
        12 => "TWELVE",
        13 => "THIRTEEN",
        14 => "FOURTEEN",
        15 => "FIFTEEN",
        16 => "SIXTEEN",
        17 => "SEVENTEEN",
        18 => "EIGHTEEN",
        19 => "NINETEEN",
      }
      
    end
  end
end
