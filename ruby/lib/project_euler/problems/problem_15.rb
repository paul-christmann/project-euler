module ProjectEuler
  module Problems
    class Problem15
      
      def initialize (grid_size)
        @grid_size = grid_size+1
        @count_cache = {}
      end
      
      def route_count
        max_index = @grid_size * @grid_size - 1
        (0..max_index).each do |i|
          r,c = pos_from_index(i)
          if r == 0 || c == 0 
            @count_cache[i] = 1
          else
            up_index = index_from_pos(r-1, c)
            up_result = @count_cache[up_index]
            
            left_index = index_from_pos(r, c-1)
            left_result = @count_cache[left_index]
            
            @count_cache[i] = up_result + left_result
          end
        end
        return @count_cache.values.max
      end
      
      def print_counts
        route_count if @count_cache.size == 0
        max = @count_cache.values.max.to_s.length
        format = "%#{max}d"
        (0..@grid_size-1).each do |row|
          line = ""
          (0..@grid_size-1).each do |col|
            line = "#{line}|#{format % @count_cache[index_from_pos(row,col)]}"
          end
          puts "#{line}|"
        end
      end
      
      protected 
      
      def index_from_pos(r,c)
        r*(@grid_size) + c
      end
      
      def pos_from_index(idx)
        c = idx % (@grid_size)
        r = (idx - c) / (@grid_size)
        return r,c
      end
      
    end
  end
end
