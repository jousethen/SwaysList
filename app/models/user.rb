class User < ApplicationRecord
  has_one :storefront
  has_many :transactions
  has_secure_password
  # accepts_nested_attributes_for :storefronts
  validates :email, presence: true

  def add_balance(amount)
    current = self.balance
    new_balance = current + amount
    self.balance = new_balance
    self.save
  end
end
