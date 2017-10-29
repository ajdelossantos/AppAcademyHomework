class ApplicationController < ActionController::Base
  #TODO remember those CSRF tokens
  # protect_from_forgery with: :exception
  #TODO helper method for html access
  helper_method :current_user
  #IDEA you have access to the sessions hash

  # instance method vs instance variable
  def current_user
    return nil unless session[:session_token]
    @current_user ||= User.find_by(session_token: session[:session_token])
  end

  def login!(user)
    session[:session_token] = user.reset_session_token!
  end

  def logout!
    current_user.reset_session_token!
    session[:session_token] = nil
  end

  #IDEA a useful helper
  def logged_in?
    current_user ? true : false
  end

  def require_logged_out
    redirect_to users_url if logged_in?
  end

  def require_logged_in
    redirect_to new_session unless logged_in?
  end
end
