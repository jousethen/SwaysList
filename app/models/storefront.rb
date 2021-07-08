class Storefront < ApplicationRecord
  belongs_to :user, foreign_key: "owner_id"
  has_many :items
  has_many :transactions
end
