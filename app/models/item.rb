class Item < ApplicationRecord
  has_and_belongs_to_many :categories
  belongs_to :storefront
  has_and_belongs_to_many :transactions
  has_many :users, through: :transactions
end
