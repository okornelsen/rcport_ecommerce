class HomeController < ApplicationController
  def index
    @products_on_sale = Product.includes(:pricetype).where("pricetypes.name LIKE 'On Sale'").references(:pricetypes).limit(4)
    @products_new = Product.includes(:pricetype).where("pricetypes.name LIKE 'New'").references(:pricetypes).order(:created_at).limit(4)
  end
end
