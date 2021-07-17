class Transaction < ApplicationRecord
  belongs_to :user
  has_many :item_transactions
  has_many :items, through: :item_transactions
end

