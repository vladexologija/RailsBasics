require File.dirname(__FILE__) + '/../spec_helper'

describe Post do

  it "description should be 'n/a' if not available" do
    post = Post.new
    post.description.should == "n/a"
  end

  it "description should return category when available" do
    post = Post.new({:description => "something"})
    post.description.should == "something"
  end
end
