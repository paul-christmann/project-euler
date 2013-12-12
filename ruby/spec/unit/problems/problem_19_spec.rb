require 'project_euler/problems/problem_19'
include ProjectEuler::Problems

describe Problem19 do
  describe 'problem 19' do
    
    it 'should solve problem' do
      p = Problem19.new(2013, 2013)
      p.num_sundays.should == 2
    end

    it 'should solve problem' do
      p = Problem19.new(1901, 2000)
      p.num_sundays.should == 171
    end
    
    it 'should solve baseline' do
      d = Problem19::JANUARY_1_1900
      d.day.should == 0
      d.dow.should == 1
      d.is_first_of_month?.should == true
      d.is_sunday?.should == false
      d.days_in_month.should == 31
      d.next.next.next.next.next.next.is_sunday?.should == true
    end
    
    it 'should solve one leap year' do
      d = Problem19::JANUARY_1_1900
      while d.year != 1904 
        d = d.next
      end
      d.year.should == 1904
      d.dom.should == 1
      d.month.should == 1
      (1..31).each do
        d = d.next
      end
      d.year.should == 1904
      d.dom.should == 1
      d.month.should == 2
      (1..28).each do
        d = d.next
      end
      d.year.should == 1904
      d.dom.should == 29
      d.month.should == 2

      d = d.next
      d.dom.should == 1
      d.month.should == 3
    end
    it 'should solve one non-leap year' do
      d = Problem19::JANUARY_1_1900
      (1..30).each do
        d = d.next
      end
      d.dom.should == 31
      d.month.should == 1
      d.year.should == 1900
      
      d = d.next
      d.dom.should == 1
      d.month.should == 2
      d.year.should == 1900
      (1..27).each do 
        d = d.next
      end
      d.dom.should == 28
      d.month.should == 2
      d.year.should == 1900
      
      d = d.next
      d.dom.should == 1
      d.month.should == 3
      d.year.should == 1900
      
      d = Problem19::JANUARY_1_1900
      (1..364).each do
        d = d.next
      end
      d.dom.should == 31
      d.month.should == 12
      d.year.should == 1900
      
      d = d.next
      d.dom.should == 1
      d.month.should == 1
      d.year.should == 1901
    end

  end
end
