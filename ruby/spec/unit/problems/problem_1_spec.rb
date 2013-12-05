require 'project_euler/problems/problem_1'
include ProjectEuler::Problems

describe ProblemOne do
  describe 'problem one' do
    it 'should validate baseline' do
      p1 = ProblemOne.new(3, 5, 10)
      p1.sum.should == 23
    end
    it 'should calculate answer' do
      p1 = ProblemOne.new(3, 5, 1000)
      p1.sum.should == 233168
    end
  end
end
