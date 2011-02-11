# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery

  # Scrub sensitive parameters from your log
  filter_parameter_logging :password, :password_confirmation
  helper_method :current_user_session, :current_user 

  protected
  def current_user_session 
    @current_user_session || (@current_user_session = UserSession.find) || UserSession.new  
  end
  
  def current_user 
    @current_user || @current_user = (current_user_session && current_user_session.user) 
  end
end
