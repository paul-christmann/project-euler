require 'project_euler/problems/problem_15'
include ProjectEuler::Problems

describe 'Problem15' do
  describe 'problem 15' do
    it 'should solve baseline' do
      p = Problem15.new(1)
      p.route_count.should == 2
    end
    it 'should solve baseline' do
      p = Problem15.new(2)
      p.route_count.should == 6
    end
    it 'should solve baseline' do
      p = Problem15.new(3)
      p.route_count.should == 20
    end
    it 'should solve baseline' do
      p = Problem15.new(4)
      p.route_count.should == 70
    end
    it 'should solve baseline' do
      p = Problem15.new(5)
      p.route_count.should == 252
    end
    it 'should solve baseline' do
      p = Problem15.new(6)
      p.route_count.should == 924
    end
    it 'should solve' do
      p = Problem15.new(20)
      p.route_count.should == 137846528820
    end
  end
end
