require 'project_euler/problems/problem_23'
require 'project_euler/util/number'

include ProjectEuler::Util
include ProjectEuler::Problems

describe ProjectEuler do
  describe Problem23 do
    describe 'should calculate answer' do
      it 'should calculate answer' do
        # p = Problem23.new
        # sums = p.non_abundant_sums
        # sums.length.should == 1456
        # sums.inject(:+).should == 4179871
      end
    end
  end
end
