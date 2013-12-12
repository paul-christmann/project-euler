require 'project_euler/problems/problem_19'
include ProjectEuler::Problems

describe Problem19 do
  describe 'problem 19' do
    
    it 'should solve baseline' do
      p = Problem19.new(1901, 1901)
      p.num_sundays.should == 3
    end
  end
end
