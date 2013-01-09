class UserSessionsController < ApplicationController
  before_filter :authenticate, :only => :destroy

  caches_page :new

  def new
    @user_session = UserSession.new
  end

  def create
    @user_session = UserSession.new(params[:user_session])

    if @user_session.save
      redirect_to root_url, notice: 'Successfully logged in'
    else
      render :new
    end
  end

  def destroy
    current_user_session.destroy
    redirect_to login_path
  end
end
