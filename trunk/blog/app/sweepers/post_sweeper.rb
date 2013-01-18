class PostSweeper < ActionController::Caching::Sweeper
  observe Post

  def sweep(post)
    expire_fragment "recent_posts"
    expire_page posts_path
    expire_page root_path
  end

  alias_method :after_update, :sweep
  alias_method :after_create, :sweep
  alias_method :after_destroy, :sweep

end
