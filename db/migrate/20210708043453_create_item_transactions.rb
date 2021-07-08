class CreateItemTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :item_transactions do |t|
      t.belongs_to :item, null: false, foreign_key: true
      t.belongs_to :transaction, null: false, foreign_key: true

      t.timestamps
    end
  end
end
