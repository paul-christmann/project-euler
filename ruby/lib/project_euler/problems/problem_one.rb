require 'project_euler/util/multiples'
include ProjectEuler::Util
module ProjectEuler
  module Problems
    class ProblemOne
      def initialize (factor1, factor2, maximum)
        @m1 = Multiples.new(:factor => factor1, :maximum => maximum)
        @m2 = Multiples.new(:factor => factor2, :maximum => maximum)
      end
      def sum
        (@m1.factors + @m2.factors).sort.uniq.inject(:+)
      end
    end
  end
end