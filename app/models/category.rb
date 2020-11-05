class Category < ApplicationRecord
  has_many :productcategories
  has_many :products, through: :productcategories

  validates :vehicle_type, presence: true
end
