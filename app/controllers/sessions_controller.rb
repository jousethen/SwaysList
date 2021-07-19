class SessionsController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :create
  skip_before_action :verified_user, only: [:new, :create]
  def new
  end
  
  def logout
    render 'logout'
  end

  def create
    pp request.env['omniauth.auth']
    session[:omniauth_data] = request.env['omniauth.auth']
    
    if session[:omniauth_data]
      user = User.find_by(email: session[:omniauth_data][:info][:email].downcase)
    else

      user = User.find_by(email: params[:email].downcase)
    end
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
