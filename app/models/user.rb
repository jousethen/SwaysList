class User < ApplicationRecord
  has_one :storefront, foreign_key: "owner_id"
  has_many :transactions
  has_secure_password
  # accepts_nested_attributes_for :storefronts
  validates :email, presence: true
  validates :email, uniqueness: true

  def add_balance(amount)
    current = self.balance
    new_balance = current + amount
    self.balance = new_balance
    self.save
  end

  def storefront

  end
end
