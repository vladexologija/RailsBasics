class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :current_user, :current_user_session

  protected
  def authenticate
    flash[:notice] = "You are not logged in sir"
    redirect_to login_path
    return false
  end

  private
  def current_user_session
    return @current_user_session if defined?(@current_user_session)
    @current_user_session = UserSession.find
  end

  def current_user
    return @current_user if defined?(@current_user)
    @current_user = current_user_session && current_user_session.record
  end

end
