require 'project_euler/problems/problem_9'
include ProjectEuler::Problems

describe Problem9 do
  describe 'problem 9' do
    it 'should validate baseline' do
      p = Problem9.new
      p.pythagorean_product(12).should == 60
    end
    it 'should solve' do
      p = Problem9.new
      p.pythagorean_product(1000).should == 31875000
    end
  end
end
