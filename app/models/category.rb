class Category < ApplicationRecord
  has_many :productcategories
  has_many :products, through: :productcategories

  validates :name, presence: true
end
