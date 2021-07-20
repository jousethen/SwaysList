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
    
    if session[:omniauth_data] #Github Login
      user = User.find_by(email: session[:omniauth_data][:info][:email].downcase)
      
      if user 
        session[:user_id] = user.id
         redirect_to "/"
      else
        redirect_to '/login', alert: "Unable to Authenticate"
      end

    else #Normal Sign Up
      user = User.find_by(email: params[:email].downcase)
      

      if user && user.authenticate(params[:password])
        if user.vendor
          session[:vendor] = user.id
        end

        session[:user_id] = user.id
        redirect_to "/"
      else
        redirect_to '/login', alert: "Unable to Authenticate"
      end
    end

     
  end

 def destroy
    session.delete :user_id
    session.delete :vendor
    session.delete :cart
    session.delete :omniauth_data
    redirect_to '/'
  end
end
