module ProjectEuler
  module Problems
    class Problem19
      def initialize(start_year, end_year)
        @start_year = start_year
        @end_year = end_year
      end
      
      def num_sundays
        result = 0
        day = JANUARY_1_1900
        while day.year <= @end_year
          if day.year >= @start_year
            if day.is_sunday? && day.is_first_of_month?
              result +=1 
            end
          end
          day = day.next
        end
        result
      end
    end
    
    class Date19
      attr_accessor :year, :month, :dow, :dom, :day
      def initialize(attrs)
        self.year = attrs[:year]
        self.month = attrs[:month]
        self.dow = attrs[:dow] % 7
        self.dom = attrs[:dom] 
        self.day = attrs[:day]
      end
      
      def is_sunday?
        self.dow == 0
      end
      
      def is_first_of_month?
        self.dom == 1
      end
      
      def days_in_month
        if [1,3,5,7,8,10,12].include?(self.month) 
          31 
        elsif [4,6,9,11].include?(self.month) 
          30
        else
          if self.year % 400 == 0
            29
          elsif self.year % 100 == 0
            28
          elsif self.year % 4 == 0
            29
          else
            28
          end
        end
      end
      
      def next
        next_year = self.year
        next_day = self.day + 1
        
        next_dow = (self.dow + 1) % 7
        
        if self.dom + 1 > days_in_month
          next_dom = 1
          next_month = self.month + 1
          
          if next_month > 12
            next_month = 1
            next_year = year + 1
          end
          
        else
          next_dom = self.dom + 1
          next_month = self.month
        end
        
        Problem19::Date19.new({:year => next_year, :month => next_month, :dow => next_dow, :dom => next_dom, :day => next_day})
      end
    end
    
    JANUARY_1_1900 = ProjectEuler::Problems::Problem19::Date19.new({:day => 0, :year => 1900, :month => 1, :dow => 1, :dom => 1})
    
  end
end
