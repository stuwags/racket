class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def user_info
     @user = User.find_by_access_token(session[:access_token])
  end
  
end
