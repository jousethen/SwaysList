class UsersController < ApplicationController
  protect_from_forgery except: :add_balance

  def new
    @user = User.new
  end

  def edit
    @user = User.find(session[:user_id])
  end

  def add_balance
    user = User.find(session[:user_id])
    user.add_balance(params[:balance].to_i)
    redirect_to edit_user_path(user)
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

  def update
    @user = User.find(params[:id])

    @user.update(user_params)

    if @user.save
      redirect_to "/"
    else
      redirect_to edit_user_path(@user.id)
    end
  end

  private 
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :balance, :address, :password, :vendor)
  end


end
