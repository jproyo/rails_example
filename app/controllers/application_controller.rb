class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :secure_app

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session.has_key?(:user_id)
  	@current_user
  end

  private
  def secure_app
  	redirect_to controller: 'login' if current_user.nil?
  end
end
