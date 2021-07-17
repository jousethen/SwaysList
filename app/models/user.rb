class User < ApplicationRecord
  has_one :storefront, foreign_key: "owner_id"
  has_many :transactions
  has_secure_password
  # accepts_nested_attributes_for :storefronts
  validates :email, presence: true
  validates :email, uniqueness: true
  before_save :make_lower_case
 

  def add_balance(amount)
    current = self.balance
    new_balance = current + amount
    self.balance = new_balance
    self.save
  end

  def full_name
    self.first_name + " " + self.last_name
  end

  def final_balance(amount)
    self.balance - amount
  end

  private
  def make_lower_case
    # Rails provides a String#titlecase method
    self.email = self.email.downcase
  end

  
end
