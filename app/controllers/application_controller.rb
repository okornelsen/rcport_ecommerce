class ApplicationController < ActionController::Base
  require "date"

  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :initialize_session
  helper_method :cart
  before_action :set_categories_dropdown

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

  private

  def cart
    Product.find(session[:cart].keys)
  end

  def initialize_session
    session[:cart] ||= {}
  end

  protected

  def configure_permitted_parameters
    added_attrs = %i[username email address province_id password password_confirmation remember_me]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
end
