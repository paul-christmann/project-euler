require 'project_euler/util/fibonacci'
include ProjectEuler::Util

module ProjectEuler
  module Problems
    class Problem25
      def initialize (options)
        @f = Fibonacci.new(:maximum => options[:maximum], :first => 1, :second => 1, :exceed_max => true)
      end
      def sequence
        @f.series
      end
    end
  end
end