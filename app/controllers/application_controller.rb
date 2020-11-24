class ApplicationController < ActionController::Base
  require "date"

  before_action :configure_permitted_parameters, if: :devise_controller?

  before_action :set_categories_dropdown
  before_action :update_new_products

  def search
    wildcard_search = "%#{params[:keywords]}%"
    category_selection = "%#{params[:category_s]}"

    @product_by_search = Product.where("name LIKE ?", wildcard_search)
    @product_by_category = Productcategory.where("category_id LIKE ?", category_selection)
    @products = Product.where("id in (?) and id in (?)", @product_by_search.ids, @product_by_category.collect { |p| p.product_id })
    @category = Category.where("id LIKE ?", category_selection)
  end

  def set_categories_dropdown
    @categories_dropdown = Category.order(:name)
  end

  protected

  def configure_permitted_parameters
    added_attrs = [:username, :email, :password, :password_confirmation, :remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
