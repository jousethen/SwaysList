class Storefront < ApplicationRecord
  belongs_to :user, foreign_key: "owner_id"
  has_many :items
  has_many :transactions
  validates :name, presence: true
  validates :name, uniqueness: true
  
end
