require 'project_euler/util/triangles'
require 'project_euler/util/number'

include ProjectEuler::Util

class TrianglesTest < BaseNumber
  include Triangles
end

describe Triangles do
  describe 'calculate triangles' do
    it 'should get triangles' do
      f = TrianglesTest.new(4)
      triangles = f.triangles
      triangles.length.should == 4
      triangles[0].should == 1
      triangles[1].should == 3
      triangles[2].should == 6
      triangles[3].should == 10
    end
    it 'should get triangles' do
      f = TrianglesTest.new(4)
      n = f.next
      triangles = n.triangles
      triangles.length.should == 5
      triangles[0].should == 1
      triangles[1].should == 3
      triangles[2].should == 6
      triangles[3].should == 10
      triangles[4].should == 15
    end
  end
end
