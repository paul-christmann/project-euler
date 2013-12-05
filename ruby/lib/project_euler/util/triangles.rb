module ProjectEuler
  module Util
    module Triangles
      attr_accessor :series

      def triangles
        self.series ||= []
        return self.series if self.number <= 0
        return self.series if self.series.length > 0
        self.series << 1
        (1..self.number-1).each do |i|
          self.series << (self.series[i-1] + i + 1)
          break if self.series.length > self.number
        end
        self.series
      end
      def next
        n = Number.new(self.number+1)
        n.series = self.triangles + [(self.series.last + self.number + 1)]
        n
      end
    end
  end
end
