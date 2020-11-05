class Category < ApplicationRecord
  has_many :products
  has_many :products, through: :productscategories

  validates :vehicle_type, presence: true
end
