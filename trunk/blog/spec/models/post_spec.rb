require File.dirname(__FILE__) + '/../spec_helper'

# creates instance of Behaviour
describe Post do
  let(:post) { Post.new }

  # better to use subject
  subject { Post.new }

  before do
    #TODO
  end

  it { should_not be_persisted }
  it { should_not be_older(Date.today) }
  its(:date) {should be_nil}

  specify { post.should_not be_persisted }

  it "should include 1" do
    [1,2,3].should include(1)
  end

  # returns instance of Example
  it "description should be 'n/a' if not available" do
    post.description.should == "n/a"
  end

  it "date should be nil" do
    post.date.should be_nil
  end

  it "should have same time" do
    date = Date.new
    date.should be_same_time(Date.new)
  end

  it "should be published" do
    expect {
      post.title = "sfdfdf"
    }.to change { post.title }.from(nil).to("sfdfdf")
  end

  after do
    #TODO
  end

end

