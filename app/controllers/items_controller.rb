class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])

    if @item.storefront != current_user.storefront
      redirect_to "/", alert: "You do not have access to this page"
    else
      render "edit"
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    item = Item.new(item_params)
    
    if item.save
      redirect_to storefront_item_path(item.storefront.id, item.id )
    else
      redirect_to new_item_path, alert: "Unable to Create Item."
    end
  end

  def update
    item = Item.find(params[:id])

    item.update(item_params)

    if item.save
      redirect_to storefront_item_path(item.storefront.id, item.id)
    else
      redirect_to edit_storefront_item_path(item.storefront.id,item.id), alert: "Invalid Name"
    end
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy

    redirect_to edit_storefront_path (current_user.storefront.id)
  end

   private 
  def item_params
    params.require(:item).permit(:name, :price, :storefront_id, :image_url, :description, category_ids:[], categories_attributes: [:name])

  end


end
