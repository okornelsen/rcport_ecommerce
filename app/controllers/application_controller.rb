class ApplicationController < ActionController::Base
  def search
    wildcard_search = "%#{params[:keywords]}%"
    category_selection = "%#{params[:category_s]}"

    @product_by_search = Product.where("name LIKE ?", wildcard_search)
    @product_by_category = Productcategory.where("category_id LIKE ?", category_selection)
    @products = Product.where("id in (?) and id in (?)", @product_by_search.ids, @product_by_category.collect { |p| p.product_id })
    @category = Category.where("id LIKE ?", category_selection)
  end

  before_action :set_categories_dropdown
  def set_categories_dropdown
    @categories_dropdown = Category.order(:vehicle_type)
  end
end
