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

    it "saves the post" do
      post_obj.should_receive(:save)
      post :create
    end

    context "when the post saves successfully" do

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

      it "description" do
        pending("jebiga")
      end

    end

  end

end
