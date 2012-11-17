class AuthController < ApplicationController

  SINGLY_API_BASE = "https://api.singly.com"

  def callback
    auth = request.env["omniauth.auth"]
    session[:access_token] = auth.credentials.token
    @token = session[:access_token]
    redirect_to :root

    @user = User.new

    # @user = session[user]
    # @user.first_name = session[first_name]
    # @user.last_name = session[last_name]
    # @user.phot0 = session[photo]
    # @user.access_token = session[access_token]
    # @user.facebook_id = session[facebook_id]
    # if @user.save
    #   redirect_to :root
    # else
    #   render :callback
    # end
  end

  def show
    @response = HTTParty.get("https://api.singly.com/profiles/facebook?access_token=#{session[:access_token]}")

  end

  def logout
    session.clear
    redirect_to :root
  end
end
