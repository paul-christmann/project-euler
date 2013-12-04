module ProjectEuler
  module Util
    class BaseNumber
      attr_accessor :number
      def initialize(number, options = {})
        self.number = number
        self.number = 0 if self.number < 0 && options[:prohibit_negative]
      end
      def to_s 
        "#{self.number}"
      end
    end
    class Number < BaseNumber
      include ProjectEuler::Util::Factors
      include ProjectEuler::Util::Multiples
    end
  end
end
