class UsersController < ApplicationController
  protect_from_forgery except: :add_balance
  skip_before_action :verified_user, only: [:new, :create]

  def new
    @user = User.new
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to edit_user_path(current_user.id)
    end
  end

  def add_balance
    current_user.add_balance(params[:balance].to_i)
    redirect_to edit_user_path(current_user)
  end

  def create
    user = User.new(user_params)
    
    if user.authenticate(params[:user][:password])
      user.save
      session[:user_id] = user.id

      if user.vendor
        session[:vendor] = user.id
        redirect_to new_storefront_path
      else
        redirect_to '/'
      end
    else
      redirect_to new_user_path
    end
  end

  def update
    current_user.update(user_params)

    if current_user.save
      redirect_to "/"
    else
      redirect_to edit_user_path(current_user.id)
    end
  end

  private 
  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :balance, :address, :password, :vendor)
  end


end
