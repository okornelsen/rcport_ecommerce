class Product < ApplicationRecord
  has_many :productcategories
  has_many :categories, through: :productcategories
  accepts_nested_attributes_for :productcategories, allow_destroy: true

  belongs_to :pricetype

  validates :name, :price, :sku, presence: true
  validates :sku, numericality: { only_integer: true }

  paginates_per 20
end
