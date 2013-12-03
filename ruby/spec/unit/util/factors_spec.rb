require 'project_euler/util/factors'

include ProjectEuler::Util

describe Factors do
  describe 'calculate factors' do
    it 'should set value' do
      Factors.new(:number=>3).number.should == 3
    end
    it 'should set value when missing' do
      Factors.new().number.should == 0
    end
    it 'should set value when negative' do
      Factors.new(:number => -1).number.should == 0
    end
    it 'should get factors for prime' do
      f = Factors.new(:number=>3)
      f.factors.length.should == 2
      f.factors[0].should == 1
      f.factors[1].should == 3
      f.is_prime?.should be_true
    end
    it 'should get factors' do
      f = Factors.new(:number=>6)
      f.factors.length.should == 4
      f.factors[0].should == 1
      f.factors[1].should == 2
      f.factors[2].should == 3
      f.factors[3].should == 6
      f.is_prime?.should be_false
    end
    it 'should get factors for square' do
      f = Factors.new(:number=>9)
      f.factors.length.should == 3
      f.factors[0].should == 1
      f.factors[1].should == 3
      f.factors[2].should == 9
    end
    it 'should get factors for edgecase' do
      f = Factors.new(:number=>1)
      f.factors.length.should == 1
      f.factors[0].should == 1
    end
  end
end
