class PostsController < ApplicationController
  before_filter :params_check

  def index
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new({:id => "12345"})
    # redirect_to :action => "index"
    # puts "URL FOR: #{url_for(post)}"
    # redirect_to post
    redirect_to posts_path
  end

  private
  def params_check
    puts "POST: #{params[:post]}"
  end

end
