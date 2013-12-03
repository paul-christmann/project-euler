require 'project_euler/util/factors'
include ProjectEuler::Util
module ProjectEuler
  module Problems
    class ProblemThree
      def initialize (number)
        @f = Number.new({:number => number})
      end
      def largest_prime
        @f.factors.reverse.each do |factor|
          return factor if Number.new(:number => factor).is_prime?
        end
        nil
      end
    end
  end
end