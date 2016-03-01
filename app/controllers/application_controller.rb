class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  

  protected 

  
  def after_sign_in_path_for(resource)
		if user_signed_in? && current_user.profile
			dashboard_path
		else
			new_profile_path
		end
  end
end
