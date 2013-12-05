require 'project_euler/problems/problem_3'
include ProjectEuler::Problems

describe ProjectEuler do
  describe 'problem three' do
    it 'should validate baseline' do
      p = ProblemThree.new(13195)
      p.largest_prime.should == 29
    end
    it 'should calculate answer' do
      p = ProblemThree.new(600851475143)
      p.largest_prime.should == 6857
    end
  end
end
