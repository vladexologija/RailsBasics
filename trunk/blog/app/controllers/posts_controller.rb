class PostsController < ApplicationController

  def index
  end

  def show

  end

  def new
    @post = Post.new
  end

  def create
    puts "POST: #{params[:post]}"
  end

end
