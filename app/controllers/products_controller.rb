class ProductsController < ApplicationController
  def index
    @products = Product.includes(:pricetype).order("name ASC").page params[:page]
  end

  def show
    @product = Product.includes(:pricetype).find(params[:id])
  end
end
