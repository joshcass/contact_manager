class SessionsController < ApplicationController
  helper_method :current_user
  def create
    user = User.find_or_create_by_auth(request.env['omniauth.auth'])
    session[:user_id] = user.id
    redirect_to root_path, notice: "Logged in as #{user.name}"
  end

  def current_user
    @current_user ||= User.find(session[:user_id])
  end
end
