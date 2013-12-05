require 'project_euler/problems/problem_25'
include ProjectEuler::Problems

describe ProjectEuler do
  describe 'problem 25' do
    it 'should validate baseline' do
      p = Problem25.new(:maximum => 100)
      sequence = p.sequence
      sequence.length.should == 12
      sequence.last.should == 144
    end
    it 'should calculate answer' do
      big_number = [*1..999].inject(1){|r| r = r * 10}
      p = Problem25.new(:maximum => big_number)
      sequence = p.sequence
      sequence.length.should == 4782
    end
  end
end
