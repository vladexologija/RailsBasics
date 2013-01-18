require File.dirname(__FILE__) + '/../spec_helper'

describe Post do
  let(:post) { Factory(:timesheet) }


  it "description should be 'n/a' if not available" do
    post.description.should == "n/a"
  end

  it "description should return something when available" do
    post.description.should == "something"
  end

  describe "validation of description worked" do
    it "fails if description is shorter than 5 characters" do
      post.description = "two"
      post.should have(1).error_on(:description)
    end

    it "passes with longer description" do
      post.description = "description"
      post.should have(0).error_on(:description)
    end
  end

  context "when submited" do

    it "updates the time" do
      post.created_at.should_not be_nil
      post.submit
    end
  end
end
