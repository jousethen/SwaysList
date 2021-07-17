class ItemTransaction < ApplicationRecord
  belongs_to :item
  belongs_to :order, foreign_key: "transaction_id", class_name: "Transaction"
end
