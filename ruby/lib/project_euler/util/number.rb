module ProjectEuler
  module Util
    class Number
      include ProjectEuler::Util::Factors
      include ProjectEuler::Util::Multiples
      attr_accessor :number
      def initialize(options={})
        self.number = options[:number].to_i
        self.number = 0 if self.number < 0
      end
    end
  end
end
