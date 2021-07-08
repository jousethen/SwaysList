class CreateStorefronts < ActiveRecord::Migration[6.1]
  def change
    create_table :storefronts do |t|
      t.integer :owner_id
      t.string :name

      t.timestamps
    end
  end
end
