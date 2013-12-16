require 'project_euler/problems/problem_21'
require 'project_euler/util/number'

include ProjectEuler::Util
include ProjectEuler::Problems

describe ProjectEuler do
  describe 'problem 21' do
    describe 'should validate baseline' do
      it 'should get divisors of 220' do
        n = Number.new(220)
        factors = n.factors
        factors.length.should == 12
      end
      it 'should get divisors of 284' do
        n = Number.new(284)
        factors = n.factors
        factors.length.should == 6
      end
      it 'should validate amicable' do
        sum_220 = Number.new(220).factors.inject(:+) - 220
        sum_284 = Number.new(284).factors.inject(:+) - 284
        sum_220.should == 284
        sum_284.should == 220
      end
      it 'should calculate answer' do
        p = Problem21.new(300)
        amicables = p.amicables
        amicables.length.should == 1
        amicables[0][0].should == 220
        amicables[0][1].should == 284
      end
      it 'should calculate answer sum' do
        p = Problem21.new(300)
        p.amicables_sum.should == (220 + 284)
      end
      
    end
    it 'should calculate answer' do
      p = Problem21.new(10000)
      p.amicables.length.should == 5
    end
    it 'should calculate answer sum' do
      p = Problem21.new(10000)
      p.amicables_sum.should == 31626
    end
  end
end
