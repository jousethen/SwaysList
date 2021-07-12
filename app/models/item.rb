class Item < ApplicationRecord
  has_and_belongs_to_many :categories
  belongs_to :storefront
  has_and_belongs_to_many :transactions
  has_many :users, through: :transactions
  accepts_nested_attributes_for :categories

  def categories_attributes=(category_attributes)
    category_attributes.values.each do |category_attribute|
      category = Category.find_or_create_by(category_attribute)
      self.categories << category
    end
  end

end
