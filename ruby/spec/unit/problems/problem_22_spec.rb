include ProjectEuler::Problems

describe ProjectEuler do
  
  ZERO = 'A'.ord - 1
  def numeric_value_of(name)
    name.split('').inject(0){|r, c| r = r + (c.ord - ZERO)}
  end
  
  describe "Problem22" do
    before (:all) do
      @names = []
      File.open("./problem_22_names.txt", "r").each_line do |line|
        @names = line.split(',').map{|n| n.gsub(/\"/,'')}
      end
    end

    describe 'baseline' do
      it 'should have right entries' do
        @names.length.should == 5163
        @names[0].should == "MARY"
        @names[1].should == "PATRICIA"
        @names[2] == "LINDA"
      end
      it 'should calculate answer' do
        numeric_value_of("COLIN").should == 53
      end
      it 'should sort' do
        sorted = @names.sort
        sorted.first[0].should == 'A'
        sorted[937].should == "COLIN"
      end
    end
    describe 'solution' do
      it 'should solve' do
        result = 0
        @names.sort.each_with_index do |name, index|
          name_score = (index+1) * numeric_value_of(name)
          result = result + name_score
        end
        result.should == 871198282
      end
    end
  end
end
