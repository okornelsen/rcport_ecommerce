class CategoriesController < ApplicationController
  def index
    @categories = Category.order(:name)
    @filters = Pricetype.includes(:products).order(:pricetype)
  end

  def show
    @category = Category.includes(:products).find(params[:id]).products.page params[:page]
  end
end
