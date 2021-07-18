class TransactionsController < ApplicationController
 helper_method :cart_total, :cart_items
 
 def cart_total
    cost = 0
    session[:cart].each do |i|
      item = Item.find(i)
      cost += item.price.to_i
    end
  
    cost
  end

  def cart_items
    items = session[:cart].collect do |i|
      Item.find(i)
    end

    items
  end

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
  
  def index
    if !!current_user.transactions
      @transactions = current_user.transactions
    else
      @transactions = []
    end
  end
  
  def new
    if current_user.final_balance(cart_total) < 0
      redirect_to '/cart', alert: "You do not have enough money to complete this transaction"
    end
  end

  def create
    transaction = Transaction.create(user_id: current_user.id)

    cart_items.each do |i|
      transaction.items << i
    end

    session.delete :cart
    redirect_to transactions_path
  end

  def show
    @transaction = Transaction.find(params[:id])
  end
  
end
