module ProjectEuler
  module Problems
    class Problem18
      def initialize (triangle)
        @grid_size = triangle.size
        @grid = []
        @sums = []
        
        (0..@grid_size-1).each do |i|
          @grid[i] = []
        end
        (0..@grid_size-1).each do |i|
          t_col = i
          t_row = 0
          (0..@grid_size-1).each do |j|
            if ( i + j >= @grid_size )
              @grid[i][j] = 0
            else
              @grid[i][j] = triangle[t_col][t_row]
            end
            t_row += 1
            t_col += 1
          end
        end
      end
      
      def grid_as_string
        as_string(@grid)
      end
      
      def sums_as_string
        summarize
        as_string(@sums)
      end
      
      def as_string(grid)
        "\n#{grid.map{|row| row.join(' | ')}.join("\n")}"
      end
      
      def max_sum
        summarize
        @sums[0][0]
      end
      
      def summarize
        if @sums.size == 0
          (0..@grid_size-1).each do |i|
            @sums[i] = []
          end
          [*0..@grid_size-1].reverse.each do |row|
            [*0..@grid_size-1].reverse.each do |col|
              right = col < @grid_size-1 ? @sums[row][col+1] : 0
              down  = row < @grid_size-1 ? @sums[row+1][col] : 0
              @sums[row][col] = [@grid[row][col] + right, @grid[row][col] + down].max
            end
          end
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
