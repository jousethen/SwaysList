class TransactionsController < ApplicationController
  def add_item
    item = Item.find(params[:id])
    
    if session[:cart]
      session[:cart] << params[:id]
    else
      session[:cart] = []
      session[:cart] << params[:id]
    end

    flash.alert = "#{item.name} added to cart"
    redirect_to storefront_item_path(item.storefront.id, item.id)
  end
  
  
end
