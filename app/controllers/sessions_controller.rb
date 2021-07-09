class SessionsController < ApplicationController
  def new
  end

  def logout
  end

  def create
    params.inspect
    user = User.find_by(email: params[:email])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to storefronts_path
    else
      redirect_to '/login', alert: "Unable to Authenticate"
    end
  end

 def destroy
    session.delete :user_id
    redirect_to '/'
  end
end
