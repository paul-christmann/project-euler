require 'project_euler/problems/problem_12'
include ProjectEuler::Problems

describe Problem12 do
  describe 'problem 12' do
    it 'should validate baseline' do
      p = Problem12.new(5)
      p.first_triangle(10).should == 28
    end
    it 'should solve' do
      p = Problem12.new(500)
      p.first_triangle(1000000).should == 76576500
    end
  end
end
