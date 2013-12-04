require 'project_euler/problems/problem_six'
include ProjectEuler::Problems

describe ProblemSix do
  describe 'problem six' do
    it 'should validate baseline' do
      p = ProblemSix.new(10)
      p.difference.should == 2640
    end
    it 'should calculate answer' do
      p = ProblemSix.new(100)
      p.difference.should == 25164150
    end
  end
end
