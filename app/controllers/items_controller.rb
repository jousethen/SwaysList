class ItemsController < ApplicationController
  def new
    @item = Item.new
  end

  def edit
    @item = Item.find(params[:id])
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

   private 
  def item_params
    params.require(:item).permit(:name, :price, :storefront_id, :image_url, :description, category_ids:[], categories_attributes: [:name])

  end


end
