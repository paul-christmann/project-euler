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
  describe 'should solve large' do
    it 'should find sum' do
      (0..5).each do |test_number|
        puts "TESTING #{test_number}"
        array = []
        (0..100000).each do |i|
          # crufty way to get 0s and positivies
          array << Random.rand(100000000000) * ( i % 2 == 0 ? +1 : -1 )
        end
        p = ArraySum.new(array)
        sum_elements = p.zero_sum_elements
        sum_elements.length.should == 3
        sum_elements.inject(:+).should == 0
        puts sum_elements.inspect
      end
    end
  end
end
