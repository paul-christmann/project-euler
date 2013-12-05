require 'project_euler/util/primes'
include ProjectEuler::Util

class PrimesTest < BaseNumber
  include Primes
end

describe Primes do
  describe 'calculate primes' do
    it 'should get primes by count' do
      primes = PrimesTest.new(5, :type => Primes::COUNT).primes
      primes.length.should == 5
      primes[0].should == 2
      primes[1].should == 3
      primes[2].should == 5
      primes[3].should == 7
      primes[4].should == 11
    end
    it 'should get primes by max' do
      primes = PrimesTest.new(20, :type => Primes::MAX_VALUE).primes
      primes.length.should == 8
      primes[0].should == 2
      primes[1].should == 3
      primes[2].should == 5
      primes[3].should == 7
      primes[4].should == 11
      primes[5].should == 13
      primes[6].should == 17
      primes[7].should == 19
    end
    it 'should get primes by max as default' do
      primes = PrimesTest.new(20).primes
      primes.length.should == 8
      primes[0].should == 2
      primes[1].should == 3
      primes[2].should == 5
      primes[3].should == 7
      primes[4].should == 11
      primes[5].should == 13
      primes[6].should == 17
      primes[7].should == 19
    end
  end
end
