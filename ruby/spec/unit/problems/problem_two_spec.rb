require 'project_euler/problems/problem_two'
include ProjectEuler::Problems

describe ProjectEuler do
  describe 'problem one' do
    it 'should validate baseline' do
      p = ProblemTwo.new(:maximum => 100)
      p.sum.should == 44
    end
    it 'should calculate answer' do
      p = ProblemTwo.new(:maximum => 4000000)
      p.sum.should == 4613732
    end
  end
end
