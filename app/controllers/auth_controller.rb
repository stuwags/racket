class AuthController < ApplicationController

  SINGLY_API_BASE = "https://api.singly.com"

  def callback
    auth = request.env["omniauth.auth"]
    session[:access_token] = auth.credentials.token
    @token = session[:access_token]
    redirect_to :root

    @user = User.new

    auth = request.env["omniauth.auth"]
    session[:access_token] = auth.credentials.token
    # redirect_to :root

    response = HTTParty.get("https://api.singly.com/profiles/facebook?access_token=#{session[:access_token]}")

    user = User.new
    user.first_name = response["data"]["first_name"]
    user.last_name = response["data"]["last_name"]
    user.facebook_id = response["data"]["id"]
    user.access_token = session[:access_token]
    user.photo = response["data"]["picture"]["data"]["url"]

    if !User.find_by_facebook_id(user.facebook_id)
      user.save
    end
  end

  def show
    @response = HTTParty.get("https://api.singly.com/profiles/facebook?access_token=#{session[:access_token]}")

  end

  def logout
    session.clear
    redirect_to :root
  end
end
