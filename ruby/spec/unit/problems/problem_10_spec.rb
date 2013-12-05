require 'project_euler/problems/problem_10'
include ProjectEuler::Problems

describe Problem10 do
  describe 'problem 10' do
    it 'should validate baseline' do
      p = Problem10.new(10)
      p.primes.inject(:+).should == 17
    end
    it 'should solve' do
      p = Problem10.new(2000000)
      p.primes.inject(:+).should == 142913828922
    end
  end
end
