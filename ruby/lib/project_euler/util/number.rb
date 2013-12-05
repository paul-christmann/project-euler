require 'project_euler/util/factors'
require 'project_euler/util/multiples'
require 'project_euler/util/primes'
require 'project_euler/util/triangles'

module ProjectEuler
  module Util
    class BaseNumber
      attr_accessor :number, :options
      def initialize(number, options = {})
        self.number = number
        self.number = 0 if self.number < 0 && options[:prohibit_negative]
        self.options = options.dup
      end
      def to_s 
        "#{self.number}"
      end
    end
    class Number < BaseNumber
      include ProjectEuler::Util::Factors
      include ProjectEuler::Util::Multiples
      include ProjectEuler::Util::Primes
      include ProjectEuler::Util::Triangles
      def self.is_prime?(n)
        Number.new(n).is_prime?
      end
    end
  end
end
