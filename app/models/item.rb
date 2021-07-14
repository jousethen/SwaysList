class Item < ApplicationRecord
  has_many :item_categories, dependent: :destroy
  has_many :categories, through: :item_categories
  belongs_to :storefront
  # has_and_belongs_to_many :transactions
  #has_many :users, through: :transactions
  accepts_nested_attributes_for :categories

  def categories_attributes=(category_attributes)
    
    category_attributes.values.each do |category_attribute|
      if category_attribute[:name] != ""
        category = Category.find_or_create_by(category_attribute)
        self.categories << category
      end
    end
  end

end
