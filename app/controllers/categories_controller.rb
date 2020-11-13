class CategoriesController < ApplicationController
  def index
    @categories = Category.order(:vehicle_type)
  end

  def show
    @category = Category.find(params[:id])
  end
end
