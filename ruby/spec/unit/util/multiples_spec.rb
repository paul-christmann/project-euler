require 'project_euler/util/number'
include ProjectEuler::Util

describe Multiples do
  
  describe 'calculate multiples' do
    it 'should initialize values' do
      m = Number.new(3)
      m.number.should == 3
    end
    it 'should find multiples of 3' do
      m = Number.new(3)
      m.multiples(10).length.should == 3
    end
    it 'should find multiples of 5' do
      m = Number.new(5)
      multiples = m.multiples(11)
      multiples.length.should == 2
      multiples[0].should == 5
      multiples[1].should == 10
    end
    it 'should ingnore boundary' do
      m = Number.new(5)
      multiples = m.multiples(10)
      multiples.length.should == 1
      multiples[0].should == 5
    end
    it 'should match boundary' do
      m = Number.new(5)
      multiples = m.multiples(10, :include_maximum => true)
      multiples.length.should == 2
      multiples[0].should == 5
      multiples[1].should == 10
    end
  end
end
