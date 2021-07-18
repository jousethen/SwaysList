class Storefront < ApplicationRecord
  belongs_to :user, foreign_key: "owner_id"
  has_many :items
  has_many :transactions
  validates :name, presence: true
  validates :name, uniqueness: true
  
  def self.superstores
   Storefront.joins(:items).group("storefronts.id").having("COUNT(*) > 4").select("storefronts.*")
  end
end