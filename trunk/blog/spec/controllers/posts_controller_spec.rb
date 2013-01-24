require "spec_helper"

describe PostsController do

  describe "create" do
    let(:post_obj) { mock_model(Post).as_null_object }

    before do
      Post.stub(:new).and_return(post_obj)
    end

    it "creates a new post" do
      Post.should_receive(:new).with({ "title" => "Title", "description" => "Description" }).and_return(post_obj)
      post :create, :post => { "title" => "Title", "description" => "Description" }
    end


    context "when the post saves successfully" do

      before do
        post_obj.stub(:save).and_return(true)
      end

      it "sets a flash[:notice] message" do
        post :create
        flash[:notice].should eq("The post was saved successfully.")
      end

      it "redirects to Posts index" do
        post :create
        response.should redirect_to(posts_path)
      end

    end

    context "when the post fails to save" do

      before do
        post_obj.stub(:save).and_return(false)
      end

      it "assigns @post" do
        post :create
        # returns hash representing instance variables
        assigns(:post).should eq(post_obj)
      end

      it "renders the new template" do
        post :create
        response.should render_template("new")
      end

    end

  end

end
