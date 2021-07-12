class RemoveTransactionIdFromItems < ActiveRecord::Migration[6.1]
  def change
    remove_column :items, :transaction_id, :integer
  end
end
