require 'project_euler/problems/problem_one'

describe ProjectEuler do
  describe 'problem one' do
    it 'should validate baseline' do
      p1 = ProjectEuler::Problems::ProblemOne.new(3, 5, 10)
      p1.sum.should == 23
    end
    it 'should calculate answer' do
      p1 = ProjectEuler::Problems::ProblemOne.new(3, 5, 1000)
      p1.sum.should == 233168
    end
  end
end
