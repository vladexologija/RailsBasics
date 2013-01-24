require 'spec_helper'

describe ApplicationHelper do
  describe "display_for(:role)" do
      context "when current user has the role" do
        it "display the content" do
          user = stub("User", :in_role? => true)
          helper.stub(:current_user).and_return(user)
          content = helper.display_for(:existing_role) { "content"}
          content.should == "content"
        end
      end

      context "when the user doesn't have the role" do
        it "does not display the content" do
          user = stub("User", :in_role? => false)
          helper.stub(:current_user).and_return(user)
          content = helper.display_for(:existing_role) { "content"}
          content.should == nil
        end
      end
    end
end
