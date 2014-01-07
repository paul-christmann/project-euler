module Util
  class ArraySum
    attr_accessor :array, :pos_array, :neg_array, :zero_array, :array_hash
    def initialize(array)
      self.array = array.dup
      self.array_hash = {}
      array.each do |i|
        self.array_hash[i] = true
      end
      
      self.neg_array, self.pos_array = array.partition{|x| x < 0}

      self.pos_array, self.zero_array = self.pos_array.partition{|x| x>0}
      
      # self.neg_array = self.neg_array.sort.uniq
      # self.pos_array = self.pos_array.sort.uniq

      puts "Starting test with #{self.pos_array.length} pos, #{self.neg_array.length} neg, #{self.zero_array.length} zero, #{self.array_hash.size} total"

    end
    
    def zero_sum_elements
      
      return [] if (self.pos_array.empty? || self.neg_array.empty?) && self.zero_array.length < 3\
      
      return [0,0,0] if self.zero_array.length >= 3
      
      if self.zero_array.any?
        # look for complements in pos_array and neg_array
        self.neg_array.each do |i|
          return [0, i, -1 * i] if self.array_hash[-1 * i]
        end
      end
      
      self.neg_array[0..self.neg_array.length-1].each_with_index do |i, idx|
        self.neg_array[(idx+1)..self.neg_array.length-1].each do |j|
          return [i, j, -1 * (i+j)] if self.array_hash[-1*(i+j)]
        end
      end
      
      self.pos_array[0..self.pos_array.length-1].each_with_index do |i, idx|
        self.pos_array[(idx+1)..self.pos_array.length-1].each do |j|
          return [i, j, -1 * (i+j)] if self.array_hash[-1*(i+j)]
        end
      end
      []
    end

    def has_zero_sum
      zero_sum_elements.any?
    end
  end
end
