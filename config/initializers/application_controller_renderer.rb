# Be sure to restart your server when you modify this file.

# ActiveSupport::Reloader.to_prepare do
#   ApplicationController.renderer.defaults.merge!(
#     http_host: 'example.org',
#     https: false
#   )
# end

def update_new_products
  @new_products = Product.includes(:pricetype).where("pricetypes.name LIKE 'New'").references(:pricetypes)
  unless @new_products.nil?
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
