require 'project_euler/util/number'

include ProjectEuler::Util

class FactorsTest < BaseNumber
  include Factors
end

describe Factors do
  describe 'calculate prime' do
    it 'should know prime' do
      Number.new(:number => 17).is_prime?.should be_true
    end
    it 'should know not prime' do
      Number.new(:number => 18).is_prime?.should be_false
    end
  end
  describe 'calculate factors' do
    it 'should set value' do
      Number.new(:number=>3).number.should == 3
    end
    it 'should set value when missing' do
      Number.new.number.should == 0
    end
    it 'should set value when negative' do
      Number.new(:number => -1).number.should == 0
    end
    it 'should get factors for prime' do
      f = FactorsTest.new(:number=>3)
      f.factors.length.should == 2
      f.factors[0].should == 1
      f.factors[1].should == 3
      f.is_prime?.should be_true
    end
    it 'should get factors' do
      f = FactorsTest.new(:number=>6)
      f.factors.length.should == 4
      f.factors[0].should == 1
      f.factors[1].should == 2
      f.factors[2].should == 3
      f.factors[3].should == 6
      f.is_prime?.should be_false
    end
    it 'should get factors for square' do
      f = FactorsTest.new(:number=>9)
      f.factors.length.should == 3
      f.factors[0].should == 1
      f.factors[1].should == 3
      f.factors[2].should == 9
    end
    it 'should get factors for edgecase' do
      f = FactorsTest.new(:number=>1)
      f.factors.length.should == 1
      f.factors[0].should == 1
    end
  end
end
