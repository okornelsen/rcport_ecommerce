class CreateProducts < ActiveRecord::Migration[6.0]
  def change
    create_table :products do |t|
      t.string :name
      t.string :price
      t.integer :sku
      t.string :description
      t.string :part_no
      t.string :brand
      t.string :terrain_type
      t.string :drive_train
      t.string :scale
      t.string :image

      t.timestamps
    end
  end
end
