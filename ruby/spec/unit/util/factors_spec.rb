require 'project_euler/util/number'

include ProjectEuler::Util

class FactorsTest < BaseNumber
  include Factors
end

describe Factors do
  describe 'numbers initialization' do
    it 'should set value' do
      Number.new(3).number.should == 3
    end
    it 'should set value when negative' do
      Number.new(-1).number.should == -1
    end
    it 'should set value to zero when negative' do
      Number.new(-1, {:prohibit_negative => true}).number.should == 0
    end
  end
  describe 'calculate prime' do
    it 'should know prime' do
      FactorsTest.new(17).is_prime?.should be_true
    end
    it 'should know not prime' do
      FactorsTest.new(18).is_prime?.should be_false
    end
  end
  describe 'calculate factors' do
    it 'should get factors for prime' do
      f = FactorsTest.new(3)
      f.factors.length.should == 2
      f.factors[0].should == 1
      f.factors[1].should == 3
      f.is_prime?.should be_true
    end
    it 'should get factors' do
      f = FactorsTest.new(6)
      f.factors.length.should == 4
      f.factors[0].should == 1
      f.factors[1].should == 2
      f.factors[2].should == 3
      f.factors[3].should == 6
      f.is_prime?.should be_false
    end
    it 'should get factors for square' do
      f = FactorsTest.new(9)
      f.factors.length.should == 3
      f.factors[0].should == 1
      f.factors[1].should == 3
      f.factors[2].should == 9
    end
    it 'should get factors for complex' do
      f = FactorsTest.new(12)
      f.factors.length.should == 6
      f.factors[0].should == 1
      f.factors[1].should == 2
      f.factors[2].should == 3
      f.factors[3].should == 4
      f.factors[4].should == 6
      f.factors[5].should == 12
    end
    it 'should get factors for edgecase' do
      f = FactorsTest.new(1)
      f.factors.length.should == 1
      f.factors[0].should == 1
    end
  end
  describe 'calculate prime factors' do
    it 'should get prime factors for prime' do
      f = FactorsTest.new(7)
      pf = f.prime_factors
      pf.size.should == 1
      pf[7].should == 1
    end
    it 'should get prime factors for simple' do
      f = FactorsTest.new(6)
      pf = f.prime_factors
      pf.size.should == 2
      pf[2].should == 1
      pf[3].should == 1
    end
    it 'should get prime factors recursive' do
      f = FactorsTest.new(12)
      pf = f.prime_factors
      pf.size.should == 2
      pf[2].should == 2
      pf[3].should == 1
    end
  end
end
