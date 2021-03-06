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
    redirect_back(fallback_location: root_path)
  end

  def create
    user = User.new(user_create_params)
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
      redirect_to new_user_path, alert: "Unable to Create user"
    end
  end

  def update
    current_user.update(user_edit_params)

    if current_user.save
      redirect_to "/"
    else
      redirect_to edit_user_path(current_user.id)
    end
  end

  private 
  def user_create_params
    params.require(:user).permit( :first_name, :last_name, :email, :balance, :address, :password, :vendor)
  end

  def user_edit_params
    params.require(:user).permit( :first_name, :last_name, :balance, :address, :password, :vendor)
  end

end
