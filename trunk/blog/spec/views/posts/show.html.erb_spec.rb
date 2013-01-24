require 'spec_helper'

describe "posts/show" do
  it "displays title attribute" do
    assign(:post, double("Post", :title => "Title"))
    render
    rendered.should contain("Title")
  end
end
