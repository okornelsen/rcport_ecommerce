class AddPricetypeToProducts < ActiveRecord::Migration[6.0]
  def change
    add_reference :products, :pricetype, null: false, foreign_key: true
  end
end
