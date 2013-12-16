require 'project_euler/problems/problem_23'
require 'project_euler/util/number'

include ProjectEuler::Util
include ProjectEuler::Problems

describe ProjectEuler do
  describe Problem23 do
    before (:all) do
      @p = Problem23.new
    end
    describe 'should calculate answer' do
      it 'should caculate sums length' do
        sums = @p.abundant_sums
        puts "#{sums.first} and #{sums.last}"
        sums.first.should == 24
      end
      it 'should calculate answer' do
        sums = @p.non_abundant_sums
        sums.length.should == 1456
        puts "#{sums.first} and #{sums.last}"
        sums.inject(:+).should == 4179871
      end
    end
  end
end
