class PostsController < ApplicationController
  before_filter :params_check

  caches_page :index, :show
  cache_sweeper :post_sweeper

  def index
    @posts = Post.all
    # puts @posts.first.attributes
    # @posts = Post.where(:id => [1,2], :title => "Title")
    # @posts = Post.where("submited = ?", true)
    # @posts = Post.older_than(Date.today).empty
  end

  def show
     @post = Post.find(params[:id])
  end

  def edit
    if params[:title]
      @post = Post.find_by_title(params[:title])
    else
      @post = Post.find(params[:id])
    end
  end

  def new
    @post = Post.new
    puts @post.new_record?
    puts @post.persisted?
  end

  def create
    @post = Post.new(params[:post])
    # post.persisted?
    # post.new_record?
    puts @post.new_record?
    # post.save! raises exception
    if @post.save
    # redirect_to :action => "index"
    # puts "URL FOR: #{url_for(post)}"
    # redirect_to post
      puts @post.persisted?
      redirect_to posts_path
    else
      render :new
    end
  end

  def update
    #Post.update(params[:id],params[:post])
    post = Post.find(params[:id])
    if (post.update_attributes(params[:post]))
      flash[:notice] = "Sucess"
      redirect_to post_path(post)
    else
      render :edit
    end
  end

  def destroy
    # directly uses sql without instance
    Post.delete(params[:id])
    # post = Post.find(params[:id])
    # post.destroy
    redirect_to posts_path
  end

  def export
    # @posts = Post.order("created_at DESC").find_all_by_title(params[:title])
    @posts = Post.find(:all, :conditions => [ "title = ?", params[:title]], :order => "date")
    @count = Post.where("title = ? and created_at IS NOT NULL", params[:title]).count
  end

  private
  def params_check
    puts "POST: #{params[:post]}"
  end

end
