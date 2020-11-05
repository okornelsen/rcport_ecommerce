class Product < ApplicationRecord
  has_many :productcategories
  has_many :categories, through: :productcategories

  validates :name, :price, :sku, presence: true
  validates :sku, numericality: {only_integer: true}
end
