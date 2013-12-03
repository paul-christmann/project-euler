require 'project_euler/util/factors'
include ProjectEuler::Util
module ProjectEuler
  module Problems
    class ProblemThree
      def initialize (number)
        @f = Factors.new({:number => number})
      end
      def largest_prime
        @f.factors.reverse.each do |factor|
          return factor if Factors.new(:number => factor).is_prime?
        end
        nil
      end
    end
  end
end