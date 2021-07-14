class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :verified_user
  helper_method :current_user, :current_user_is_vendor?

  private

  def verified_user
    redirect_to '/login' unless user_is_authenticated
  end

  def user_is_authenticated
    !!current_user
  end

  def current_user
    User.find_by(id: session[:user_id])
  end

  def current_user_is_vendor?
    vendor = User.find_by(id: session[:vendor])
    return true if current_user == vendor
  end

  def is_owner?

  end
  
  def home
    render 'home'
  end
end
