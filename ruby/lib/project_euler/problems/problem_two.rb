require 'project_euler/util/fibonacci'
module ProjectEuler
  module Problems
    class ProblemTwo
      def initialize (options)
        @f = ProjectEuler::Util::Fibonacci.new(:maximum => options[:maximum], :first => 1, :second => 2)
      end
      def sum
        even = @f.series.select{|f| f%2 == 0}
        sum = even.inject(:+)
      end
    end
  end
end