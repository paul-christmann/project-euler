require 'project_euler/problems/problem_14'
include ProjectEuler::Problems

describe 'Problem14' do
  describe 'problem 14' do
    it 'should solve calculate chain' do
      p = Problem14.new
      chain = p.chain(13)
      chain.length.should == 10
      chain[0].should == 13
      chain[1].should == 40
      chain[2].should == 20
      chain[3].should == 10
      chain[4].should == 5
      chain[5].should == 16
      chain[6].should == 8
      chain[7].should == 4
      chain[8].should == 2
      chain[9].should == 1
    end
    
    it 'should solve' do
      p = Problem14.new
      chain = p.longest_chain(1000000)
      chain.length.should == 525
      chain[0].should == 837799
    end
  end
end
