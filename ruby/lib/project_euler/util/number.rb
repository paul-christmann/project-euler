module ProjectEuler
  module Util
    class BaseNumber
      attr_accessor :number
      def initialize(options={})
        self.number = options[:number].to_i
        self.number = 0 if self.number < 0
      end
    end
    class Number < BaseNumber
      include ProjectEuler::Util::Factors
      include ProjectEuler::Util::Multiples
    end
  end
end
