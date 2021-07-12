class StorefrontsController < ApplicationController
  skip_before_action :verified_user, only: [:index, :show]
  
  def index 
  end
  
  def show
    @storefront = Storefront.find(params[:id])
  end

  def new
    @storefront = Storefront.new
  end

  def edit
    @storefront = current_user.storefront
  end

  def create
    storefront = Storefront.new(storefront_params)
    storefront.owner_id = current_user.id
    
    if strorefront.save
      redirect_to edit_storefront_path(storefront)
    else
      redirect_to new_storefront_path, alert: "Unable to Create Storefront. Try changing the name"
    end
  end

   private 
  def storefront_params
    params.require(:user).permit(:name)
  end

end
