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





end
