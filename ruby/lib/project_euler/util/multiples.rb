module ProjectEuler
  module Util
    class Multiples
      attr_reader :factor, :maximum, :include_maximum
      def initialize(options)
        @factor = options[:factor] || 1
        @maximum = options[:maximum] || 1
        @include_maximum = options[:include_maximum]
      end
      
      def factors
        factors = []
        next_factor = factor
        while ((@include_maximum && next_factor <= maximum) || (!@include_maximum && next_factor < maximum) )
          factors << next_factor
          next_factor += factor
        end
        factors
      end
      
      def self.get_factors(options)
        Multiples.new(options).factors
      end
    end
  end
end