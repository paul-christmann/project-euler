module ProjectEuler
  module Util
    module Triangles
      def triangles
        return [] if self.number <= 0
        triangles = [1]
        (1..self.number-1).each do |i|
          triangles << (triangles[i-1] + i + 1)
          break if triangles.length > self.number
        end
        triangles
      end
    end
  end
end
