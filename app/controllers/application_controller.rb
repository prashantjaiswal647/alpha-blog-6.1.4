class ApplicationController < ActionController::Base

  helper_method :current_user, :logged_in? # When placed in application_controller from application_helper, it becomes only available to controllers. This helper_method makes it available to the views as well, which replaces the missing functionality from application_helper after removing this from there.

  def current_user
    current_user ||= User.find(session[:user_id]) if session[:user_id] # First time will set it, other times will re-use the set variable
  end

  def logged_in?
    !!current_user # turn current_user into a boolean. bang bang turns it into a boolean. Maybe 2 bangs because TRUE or FALSE. Idk, speculation.
  end

  def require_user
    if !logged_in?
      flash[:'alert-danger'] = "You must be logged in to perform that action"
      redirect_to login_path
    end
  end

end
