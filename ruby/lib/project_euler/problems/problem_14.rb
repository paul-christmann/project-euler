module ProjectEuler
  module Problems
    class Problem14
      def initialize
      end
      
      def longest_chain(max_int)
        chains = {}
        
        longest_chain = []
        (2..max_int).each do |i|
          chain = chain(i, chains)
          longest_chain = chain if chain.length > longest_chain.length
        end
        longest_chain
      end
      
      def chain(input, chain_hash = {})
        return chain_hash[input] if chain_hash[input]
        chain = []
        n = input
        while n > 1
          chain << n
          n = next_int(n)
          if chain_hash[n]
            chain = chain + chain_hash[n]
            break
          end
        end
        chain << 1 unless chain.last == 1
        chain.each_with_index do |i, index|
          next if chain_hash[i]
          subchain = chain[index, chain.length-1]
          chain_hash[i] = subchain
        end
        chain
      end
      
      protected
      def next_int(n)
        if n % 2 == 0
          n / 2
        else
          3 * n + 1
        end
      end
    end
  end
end
