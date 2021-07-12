class AddImageUrlToItem < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :image_url, :string
  end
end
