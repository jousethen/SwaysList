class User < ApplicationRecord
  has_one :storefront
  has_many :transactions
  has_secure_password
  # accepts_nested_attributes_for :storefronts
  validates :email, presence: true
end
