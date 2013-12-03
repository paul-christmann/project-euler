module ProjectEuler
  module Util
    class Fibonacci
      attr_reader :count, :maximum, :first, :second
      def initialize(options)
        @count = options[:count]
        @maximum = @count ? nil : options[:maximum]
        
        @first = (options[:first] || 0).to_i
        @second = (options[:second] || 1).to_i
      end
      
      def valid?
        @first <= @second && @first >= 0 && @second > 0
      end
      
      def series
        return [] unless valid?
        series = []
        series << @first
        
        while (!@count || @count > series.length ) do
          if series.length == 1
            next_value = @second
          else
            next_value = series[series.length-1] + series[series.length-2]
          end
          break if @maximum && next_value > @maximum
          series << next_value
        end
        series
      end
      
      def fibonacci
        if @count
          self.fib2(@count)
        else
          series.last
        end
      end
      
      def self.fibonacci(n)
        Fibonacci.new(:count => n).fibonacci
      end

      protected      
      def fib2(n)
        return @first if n <= 0
        return @second if n == 1
        return self.fib2(n-1) + self.fib2(n-2)
      end
    end
  end
end
