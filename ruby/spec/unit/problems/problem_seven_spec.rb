require 'project_euler/problems/problem_seven'
include ProjectEuler::Problems

describe ProblemSeven do
  describe 'problem 7' do
    it 'should validate baseline' do
      p = ProblemSeven.new(6)
      p.primes.last.should == 13
    end
    it 'should calculate answer' do
      p = ProblemSeven.new(10001)
      p.primes.last.should == 104743
    end
  end
end
