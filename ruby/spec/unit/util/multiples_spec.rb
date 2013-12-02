require 'project_euler/util/multiples'

describe ProjectEuler::Util::Multiples do
  
  describe 'calculate multiples' do
    it 'should initialize values' do
      m = ProjectEuler::Util::Multiples.new(:factor => 3, :maximum => 10)
      m.factor.should == 3
      m.maximum.should == 10
    end
    it 'should find multiples of 3' do
      m = ProjectEuler::Util::Multiples.new(:factor => 3, :maximum => 10)
      m.factors.length.should == 3
    end
    it 'should find multiples of 5' do
      m = ProjectEuler::Util::Multiples.new(:factor => 5, :maximum => 11)
      m.factors.length.should == 2
      m.factors[0].should == 5
      m.factors[1].should == 10
    end
    it 'should ingnore boundary' do
      m = ProjectEuler::Util::Multiples.new(:factor => 5, :maximum => 10)
      m.factors.length.should == 1
      m.factors[0].should == 5
    end
    it 'should match boundary' do
      m = ProjectEuler::Util::Multiples.new(:factor => 5, :maximum => 10, :include_maximum => true)
      m.factors.length.should == 2
      m.factors[0].should == 5
      m.factors[1].should == 10
    end
    it 'should find multiples of 3 as static' do
      ProjectEuler::Util::Multiples.get_factors(:factor => 3, :maximum => 10).length.should == 3
    end
  end
end
