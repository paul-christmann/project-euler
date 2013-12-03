require 'project_euler/util/fibonacci'

include ProjectEuler::Util

describe Fibonacci do
  
  describe 'calculate fibonacci recursive' do
    it 'should calculate last' do
      f = Fibonacci.new(:count => 7)
      f.fibonacci.should == 13
    end
    it 'should calculate last' do
      f = Fibonacci.new(:count => 7, :first => 1, :second => 2)
      f.fibonacci.should == 34
    end
    it 'should calculate last' do
      Fibonacci.fibonacci(7).should == 13
    end
  end
  
  describe 'calculate fibonacci' do
    it 'should initialize values' do
      f = Fibonacci.new(:maximum => 9)
      f.maximum.should == 9
      f.count.should be_nil
      
      f = Fibonacci.new(:count => 10)
      f.count.should == 10
      f.maximum.should be_nil

      f = Fibonacci.new(:count => 10, :maximum => 10)
      f.count.should == 10
      f.maximum.should be_nil
    end
    
    it 'should initialize first/second' do
      f = Fibonacci.new(:count => 5)
      f.first.should == 0
      f.second.should == 1
    end
    
    it 'should be valid' do
      f = Fibonacci.new(:count => 5)
      f.valid?.should be_true
    end
    
    it 'should calculate series' do
      f = Fibonacci.new(:count => 6)
      f.series.length.should == 6
      f.series[0].should == 0
      f.series[1].should == 1
      f.series[2].should == 1
      f.series[3].should == 2
      f.series[4].should == 3
      f.series[5].should == 5
    end
    
    it 'should calculate series with counters' do
      f = Fibonacci.new(:count => 4, :first => 3, :second => 20)
      f.series.length.should == 4
      f.series[0].should == 3
      f.series[1].should == 20
      f.series[2].should == 23
      f.series[3].should == 43
    end
    it 'should calculate series with maximum' do
      f = Fibonacci.new(:maximum =>20)
      f.series.length.should == 8
      f.series[0].should == 0
      f.series[1].should == 1
      f.series[2].should == 1
      f.series[3].should == 2
      f.series[4].should == 3
      f.series[5].should == 5
      f.series[6].should == 8
      f.series[7].should == 13
    end
  end
end
