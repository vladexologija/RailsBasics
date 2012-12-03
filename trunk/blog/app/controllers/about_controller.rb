class AboutController < ApplicationController

  def show
    # render :partial => "shared/partial"
    # render :text => "Rendering text"
    post = Post.new
    render :json => post
  end

end
