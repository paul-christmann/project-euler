include ProjectEuler::Problems

describe 'Problem20' do
  describe 'problem 20' do
    def sum_digits(i)
      return i if i < 10
      (i % 10) + sum_digits(i/10)
    end
    it 'should solve baseline' do
      result = [*1..10].inject(1){|result, element| result = result * element}
      result.should == 3628800
      sum_digits(result).should == 27
    end
    it 'should solve ' do
      result = [*1..100].inject(1){|result, element| result = result * element}
      sum_digits(result).should == 648
    end
  end
end
