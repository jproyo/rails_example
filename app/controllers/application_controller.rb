class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  before_filter :secure_app

  def current_user
  	@current_user ||= User.find_by(username: session[:user_id]) if session.has_key?(:user_id)
  	@current_user
  end

  def add_user(user)
    session[:user_id] = user.username
  end

  def user_service
    UserService.new(params)
  end

  private
  def secure_app
  	redirect_to controller: 'login' if current_user.nil?
  end
end
