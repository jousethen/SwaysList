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
    redirect_back(fallback_location: root_path)
  end

  def remove_item
    item = Item.find(params[:id])
    session[:cart].delete_at(session[:cart].index(params[:id]) || session[:cart].length)

    flash.alert = "#{item.name} removed to cart"
    redirect_back(fallback_location: root_path) 
  end

  def cart
  end
  
  def new
  end
  
end
