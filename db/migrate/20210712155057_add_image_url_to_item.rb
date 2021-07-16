class AddImageUrlToItem < ActiveRecord::Migration[6.1]
  def change
    add_column :items, :image_url, :string, default: "https://www.osageschools.com/wp-content/uploads/2016/11/image-coming-soon.png"
  end
end
