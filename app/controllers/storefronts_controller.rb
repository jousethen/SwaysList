class StorefrontsController < ApplicationController
  skip_before_action :verified_user, only: [:index, :show]
  
  def index 
    @storefronts = Storefront.all
  end
  
  def show
    @storefront = Storefront.find(params[:id])
  end

  def new
    @storefront = Storefront.new

    if !current_user_is_vendor?
      redirect_to "/", alert: "You must be a vendor to access this page."
    end

  end

  def edit
    @storefront = current_user.storefront
    
    if !@storefront
      redirect_to new_storefront_path
    else
      render 'edit'
    end
  
  end

  def create
    storefront = Storefront.new(storefront_params)
    
    if storefront.save
      redirect_to edit_storefront_path(storefront)
    else
      redirect_to new_storefront_path, alert: "Unable to Create Storefront. Try changing the name"
    end
  end

  def update
    storefront = current_user.storefront

    storefront.update(storefront_params)

    if storefront.save
      redirect_to storefront
    else
      redirect_to edit_storefront_path(storefront.id), alert: "Invalid Name"
    end
  end

   private 
  def storefront_params
    params.require(:storefront).permit(:name, :description, :owner_id)
  end

end
