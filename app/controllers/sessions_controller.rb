class SessionsController < ApplicationController
  skip_before_action :verified_user, only: [:new, :create]
  def new
  end
  
  def logout
    render 'logout'
  end

  def create
    user = User.find_by(email: params[:email].downcase)
    
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      
      if user.vendor
        session[:vendor] = user.id
      end
      
      redirect_to "/"
    else
      redirect_to '/login', alert: "Unable to Authenticate"
    end
  end

 def destroy
    session.delete :user_id
    session.delete :vendor
    session.delete :cart
    redirect_to '/'
  end
end
