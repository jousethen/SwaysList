module UsersHelper
  def final_balance(amount)
    current_user.balance - amount
  end
end
