class CreatePricetypes < ActiveRecord::Migration[6.0]
  def change
    create_table :pricetypes do |t|
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
