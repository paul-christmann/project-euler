require 'project_euler/problems/problem_four'
include ProjectEuler::Problems

describe ProblemFour do
  describe 'problem four' do
    it 'should initialize' do
      p1 = ProblemFour.new(2)
      p1.max_number.should == 99
      p1 = ProblemFour.new(3)
      p1.max_number.should == 999
    end
    it 'should calculate palindrome' do
      ProblemFour.is_palindrome?(9).should be_true
      ProblemFour.is_palindrome?(99).should be_true
      ProblemFour.is_palindrome?(90109).should be_true
      ProblemFour.is_palindrome?(9019).should be_false
    end
    it 'should validate baseline' do
      p1 = ProblemFour.new(2)
      p1.largest_palindrome.should == 9009
    end
    it 'should calculate answer' do
      p1 = ProblemFour.new(3)
      p1.largest_palindrome.should == 906609
    end
  end
end
