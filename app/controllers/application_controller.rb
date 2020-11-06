class ApplicationController < ActionController::Base
  def search
    wildcard_search = "%#{params[:keywords]}%"
    @products = Product.where("name LIKE ?", wildcard_search)
  end

  before_action :set_categories_dropdown
  def set_categories_dropdown
    @categories_dropdown = Category.all
  end
end
