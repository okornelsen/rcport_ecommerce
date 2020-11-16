class ProductsController < ApplicationController
  def index
    @products = Product.order("name ASC").page params[:page]
  end

  def show
    @product = Product.includes(:pricetype).find(params[:id])
  end
end
