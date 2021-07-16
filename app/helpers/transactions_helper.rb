module TransactionsHelper
  def cart_display
    if session[:cart]
      uniq_cart = session[:cart].uniq

      display = {}
      
      uniq_cart.each do |i|
        item = Item.find(i)
        
        display[item] = session[:cart].count(i)
      end
    else 
      display = "NO ITEMS IN CART"
    end

    display
  end

  def total_cost
    cost = 0
    session[:cart].each do |i|
      item = Item.find(i)
      cost += item.price.to_i
    end
  
    cost
  end
end
