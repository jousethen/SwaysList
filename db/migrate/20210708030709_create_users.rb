class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.integer :balance, default: 0
      t.string :address
      t.boolean :vendor
      t.timestamps
    end
  end
end
