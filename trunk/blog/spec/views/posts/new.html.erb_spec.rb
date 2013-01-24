require 'spec_helper'

describe "posts/new" do
  let(:post) do
    # stub_model() method is similar to mock_model() except that it creates an actual instance of the model
    # stub_model() prohibits the model instance from accessing the database
    mock_model("Post").as_new_record.as_null_object
  end

  before do
    assign(:post, post)
  end

  it "renders a form to create a post" do
    render
    rendered.should have_selector("form", :method => "post", :action => posts_path) do |form|
      form.should have_selector("input", :type => "submit" )
    end
  end

  it "renders a text field for the message title" do
    post.stub(:title => "The title")
    render
    rendered.should have_selector("form", :method => "post", :action => posts_path) do |form|
      form.should have_selector("input",
        :type => "text",
        :name => "post[title]",
        :value => "The title"
      )
    end
  end

  it "renders a text field for the message title" do
    post.stub(:description => "The description")
    render
    rendered.should have_selector("form", :method => "post", :action => posts_path) do |form|
      form.should have_selector("textarea",
        :name => "post[description]",
        :content => "The description"
      )
    end
  end

end
