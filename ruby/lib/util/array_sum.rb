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
    end
    
    def has_zero_sum
      
      return false if (self.pos_array.empty? || self.neg_array.empty?) && self.zero_array.length < 3
      return true if self.zero_array.length >= 3
      if self.zero_array.any?
        # look for complements in pos_array and neg_array
        self.neg_array.each do |i|
          return true if self.array_hash[-1 * i]
        end
      end
      new_neg_array = []
      self.neg_array.each_with_index do |i, idx|
        self.neg_array.each_with_index do |j, jdx|
          next if idx == jdx
          new_neg_array << (i+j)
        end
      end
      new_neg_array.uniq!
      new_neg_array.each do |i|
        return true if self.array_hash[-i]
      end
      
      new_pos_array = []
      self.pos_array.each_with_index do |i, idx|
        self.pos_array.each_with_index do |j, jdx|
          next if idx == jdx
          new_pos_array << (i+j)
        end
      end
      new_pos_array.uniq!
      new_pos_array.each do |i|
        return true if self.array_hash[-i]
      end
      false
    end
  end
end
