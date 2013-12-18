require 'project_euler/problems/problem_24'
include ProjectEuler::Problems

describe ProjectEuler do
  describe 'problem 24' do
    it 'should validate baseline' do
      p = Problem24.new(5)
      p.base_sequence.should == "01234"
      
      p.permutation(0).should == "01234"
      p.permutation(119).should == "43210"
      p.permutation(120).should == ""
    end
    it 'should calculate answer' do
      p = Problem24.new(10)
      p.permutation(999999).should == "2783915460"
    end
  end
end
