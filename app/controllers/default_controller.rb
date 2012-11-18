require "httparty"

class DefaultController < ApplicationController
  def home
    if access_token
      @profiles = HTTParty.get(profiles_url,
        :query => {:access_token => access_token}
      ).parsed_response
    end
  end
  
  def landing
    if access_token
      @profiles = HTTParty.get(profiles_url,
        :query => {:access_token => access_token}
      ).parsed_response
    end
    
     render :template => 'layouts/home'
  end
  
  def dashboard    
     render :template => 'layouts/dashboard'
  end

private

  def access_token
    session[:access_token]
  end

  SINGLY_API_BASE = "https://api.singly.com"

  def profiles_url
    "#{SINGLY_API_BASE}/profiles"
  end
end
