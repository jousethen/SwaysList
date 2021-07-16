module TransactionsHelper
  def cart_display
    uniq_cart = session[:cart].uniq

    display = {}
    
    uniq_cart.each do |i|
      item = Item.find(i)
      
      display[item] = session[:cart].count(i)
    end
    display
  end
end
