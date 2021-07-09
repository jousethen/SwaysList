class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    
    if user.authenticate(params[:user][:password])
      user.save
      session[:user_id] = user.id

      if user.vendor
        session[:admin] = user.id
      end
      
      redirect_to '/'
    else
      redirect_to new_user_path
    end
  end

  private 
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :balance, :address, :password, :vendor)
  end


end
