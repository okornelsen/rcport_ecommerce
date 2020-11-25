class CartController < ApplicationController
  def index
    @items = Product.find(session[:cart].keys)

    @count = 0
    @items.each do |product|
      @count += if product.saleprice.nil?
                  product.price.to_i * session[:cart][product.id.to_s]
                else
                  product.saleprice.to_i * session[:cart][product.id.to_s]
                end
    end
  end

  def create
    id = params[:id]
    cart_items = session[:cart]

    if cart_items.keys.include?(id)
      session[:cart][id] += 1
    else
      session[:cart][id] = 1
    end

    redirect_to products_path
  end

  def update
    id = params[:id]
    session[:cart][id] -= 1
    session[:cart].delete(id) if session[:cart][id].zero?

    redirect_to products_path
  end

  def destroy
    id = params[:id]
    session[:cart].delete(id)
    @deleted_id = Product.find(id)

    redirect_to cart_index_path, notice: "Successfully removed " + @deleted_id.name + " from your shopping cart!"
  end
end
