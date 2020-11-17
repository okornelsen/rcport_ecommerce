class ApplicationController < ActionController::Base
  require "date"

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
    @categories_dropdown = Category.order(:vehicle_type)
  end

  def update_new_products
    @new_products = Product.includes(:pricetype).where("pricetypes.name LIKE 'New'").references(:pricetypes)
    if !@new_products.nil?
      @base_product_id = Pricetype.where("name LIKE 'Base'").first.id
      @today = Time.zone.today
      @new_products.each do |product|
        @not_new_date = product.created_at + (86_400 * 3)
        next unless @not_new_date < @today
        product.pricetype_id = @base_product_id
        product.save
      end
    end
  end
end
