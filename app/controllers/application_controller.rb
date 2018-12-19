class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def authentication_required
    redirect_to root_path unless logged_in?
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  helper_method :current_user
end
