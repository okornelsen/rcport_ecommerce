class PricetypesController < ApplicationController
  def show
    @filter = Pricetype.includes(:products).find(params[:id]).products.page params[:page]
  end
end