class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(user)
    users_dashboard_path
  end

  def signed_in_root_path(user)
    user_url(user)
  end
end
