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
        series = []
        return series unless valid?
        
        series << @first
        series << @second
        
        while (!@count || @count > series.length ) do
          next_value = series[series.length-1] + series[series.length-2]
          break if @maximum && next_value > @maximum
          series << next_value
        end
        series
      end
    end
  end
end
