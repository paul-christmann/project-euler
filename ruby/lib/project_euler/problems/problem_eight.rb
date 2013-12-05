module ProjectEuler
  module Problems
    class ProblemEight
      
      def initialize(sequences)
        @sequence = sequences.join('')
      end
      
      def highest_product(consecutive)
        answer = 0
        for i in 0..@sequence.length do
          subseq = @sequence[i..(i+consecutive-1)]
          # next if subseq =~ /0/ 
          # Odd - string matching to skip 0 seems to make this slightly slower...
          answer = [answer,subseq.split('').inject(1){|r,v| r = r * v.to_i}].max
        end
        answer
      end
      
    end
  end
end
