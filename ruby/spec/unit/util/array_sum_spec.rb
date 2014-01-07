require 'util/array_sum'

include Util
describe ArraySum do
  describe 'solve baseline' do
    it 'should find sum' do
      array = [-2, -1, 0, 3]
      p = ArraySum.new(array)
      p.has_zero_sum.should == true
    end
    it 'should find sum' do
      array = [-2, -1, 0, 4]
      p = ArraySum.new(array)
      p.has_zero_sum.should == false
    end
  end
end
