require 'project_euler/problems/problem_17'
include ProjectEuler::Problems

describe 'Problem17' do
  describe 'problem 17' do
    it 'should solve baseline' do
      result = 0
      (1..5).each do |i|
        p = Problem17.new(i)
        result += p.as_stripped_words.length
      end
      result.should == 19
    end
    it 'should solve length of 342' do
      p = Problem17.new(342)
      p.as_stripped_words.length.should == 23
    end
    it 'should solve length of 115' do
      p = Problem17.new(115)
      p.as_stripped_words.length.should == 20
    end
    
    it 'should solve baseline' do
      p = Problem17.new(21)
      p.as_stripped_words.length.should == 9
      
      p = Problem17.new(99)
      p.as_stripped_words.should == "NINETYNINE"
      
      p = Problem17.new(133)
      p.as_stripped_words.should == "ONEHUNDREDANDTHIRTYTHREE"
      
      p = Problem17.new(611)
      p.as_words.should == "SIX HUNDRED AND ELEVEN"

      p = Problem17.new(910)
      p.as_words.should == "NINE HUNDRED AND TEN"
      
      p = Problem17.new(1000)
      p.as_stripped_words.should == "ONETHOUSAND"
    end
    it 'should solve ' do
      result = 0
      (1..1000).each do |i|
        p = Problem17.new(i)
        result += p.as_stripped_words.length
      end
      result.should == 21124
    end
  end
end
