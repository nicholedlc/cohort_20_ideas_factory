class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_user, :logged_in?, :authenticate_user

  def current_user
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end

  def logged_in?
    current_user != nil
  end

  def authenticate_user
    unless logged_in?
      flash[:alert] = "You must log in first"
      redirect_to ideas_path
    end
  end
end
