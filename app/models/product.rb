class Product < ApplicationRecord
  has_many :productscategories
  has_many :categories, through: :productscategories

  validates :name, :price, :sku, presence: true
  validates :sku, numericality: {only_integer: true}
end
