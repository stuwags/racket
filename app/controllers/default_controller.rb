class DefaultController < ApplicationController
  
  def access_token
    session[:access_token]
  end
  
  def home
    if access_token
      @profiles = HTTParty.get(profiles_url,
        :query => {:access_token => access_token}
      ).parsed_response
      
      @serves = Serve.new
      @user = User.find_by_facebook_id(@profiles["facebook"])
    end
        
    render :template => 'layouts/home'
  end
  
  def dashboard
    @profiles = HTTParty.get(profiles_url,
      :query => {:access_token => access_token}
    ).parsed_response
    
    if access_token
       @serves = Serve.new
       @user = User.find_by_facebook_id(@profiles["facebook"])

       render :template => 'layouts/dashboard'
    end

  end

private
  SINGLY_API_BASE = "https://api.singly.com"

  def profiles_url
    "#{SINGLY_API_BASE}/profiles"
  end
end
