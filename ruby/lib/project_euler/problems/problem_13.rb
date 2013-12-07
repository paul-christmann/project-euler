module ProjectEuler
  module Problems
    class Problem13
      def initialize (string_array_of_large_ints)
        
        @max_length = string_array_of_large_ints.map{|i| i.length}.max
        @strings = []
        
        string_array_of_large_ints.each do |s|
          while s.length < @max_length
            s = "0#{s}"
          end
          @strings << s
        end
      end
      def sum
        sum = ""
        carryover = 0
        result = 0
        (0..@max_length-1).each do |index|
          pos = @max_length - index - 1
          result = carryover % 10
          carryover = ( carryover - result ) / 10
          @strings.each do |s|
            i = s[pos].to_i
            result = result + i
            if result >= 10 
              carryover = carryover + 1
              result = result % 10
            end
          end
          sum = "#{result}#{sum}"
        end
        sum = "#{carryover}#{sum}" if carryover > 0
        sum
      end
    end
  end
end
