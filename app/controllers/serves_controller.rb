class ServesController < ApplicationController

  def new
  end
  
  def create
    # raise params.inspect
    @serves = Serve.new(params[:serve])
    @serves.save

    respond_to do |format|
      format.js
    end
  end
  
  def save_users
    user_id = params[:user_id]
    list = params[:list]
    
    last_serve = Serve.find(:last, :conditions => { :from_user_id => user_id });
    last_serve.update_attributes(:to_facebook_ids => list)
     
    render :nothing => true
  end

end
