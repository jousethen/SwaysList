class User < ApplicationRecord
  has_one :storefront
  has_many :transactions
end
