class ItemsController < ApplicationController
  
  def new
    @item = Item.new
  end

  def create
    item = Item.new(item_params)
    
    if item.save
      redirect_to item_path(item)
    else
      redirect_to new_item_path, alert: "Unable to Create Item."
    end
  end

  def updateTODO
    item = current_user.item

    item.update(item_params)

    if item.save
      redirect_to item
    else
      redirect_to edit_item_path(item.id), alert: "Invalid Name"
    end
  end

   private 
  def item_params
    params.require(:item).permit(:name, :price, :storefront_id, :image_url, :description, category_ids:[], categories_attributes: [:name])

  end


end
