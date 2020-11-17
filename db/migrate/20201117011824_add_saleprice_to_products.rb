class AddSalepriceToProducts < ActiveRecord::Migration[6.0]
  def change
    add_column :products, :saleprice, :integer
  end
end
