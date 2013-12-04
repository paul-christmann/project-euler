require 'project_euler/problems/problem_five'
include ProjectEuler::Problems

describe ProblemFive do
  describe 'problem four' do
    it 'should validate baseline' do
      p1 = ProblemFive.new(1..10)
      p1.smallest_multiple.should == 2520
    end
    it 'should calculate answer' do
      p1 = ProblemFive.new(1..20)
      p1.smallest_multiple.should == 232792560
    end
  end
end
