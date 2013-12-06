module ProjectEuler
  module Problems
    class Problem11
      attr_accessor :matrix, :row_count, :col_count
      def initialize(matrix)
        self.matrix = []
        matrix.each do |r|
          row = []
          self.matrix << row
          r.each do |c|
            row << c.to_i
          end
        end
        self.row_count = self.matrix.size
        self.col_count = self.matrix.first.size
      end
      def largest_product(n)
        result = 0
        self.matrix.each_with_index do |row, row_idx|
          row.each_with_index do |cell, col_idx|
            next if cell == 0
            
            can_go_right = (col_idx + n <= col_count)
            can_go_left = (col_idx + 1 >= n )
            can_go_down = (row_idx + n <= row_count)
            if can_go_right
              row_product = row[col_idx..(col_idx+n-1)].inject(:*)
              result = [row_product, result].max
            end
            if can_go_down
              col_product = 1
              (0..n-1).each do |i|
                col_product *= matrix[row_idx+i][col_idx]
              end
              result = [col_product, result].max
            end
            if can_go_right and can_go_down
              diag_product = 1
              (0..n-1).each do |i|
                diag_product *= matrix[row_idx+i][col_idx+i]
              end
              result = [diag_product, result].max
            end
            if can_go_left and can_go_down
              diag_product = 1
              (0..n-1).each do |i|
                diag_product *= matrix[row_idx+i][col_idx-i]
              end
              result = [diag_product, result].max
            end
          end
        end
        result
      end
    end
  end
end
