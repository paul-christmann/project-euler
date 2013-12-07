include ProjectEuler::Problems

describe 'Problem15' do
  describe 'problem 15' do
    it 'should solve baseline' do
      result = [*1..15].inject(1){|i| i*2}
      result.should == 32768
      sum = result.to_s.split('').inject(0){|r, k| r = r + k.to_i}
      sum.should == 26
    end
    it 'should solve ' do
      result = [*1..1000].inject(1){|i| i*2}
      sum = result.to_s.split('').inject(0){|r, k| r = r + k.to_i}
      sum.should == 1366
    end
  end
end
