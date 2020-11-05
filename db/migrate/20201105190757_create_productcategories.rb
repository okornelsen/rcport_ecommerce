class CreateProductcategories < ActiveRecord::Migration[6.0]
  def change
    create_table :productcategories do |t|
      t.references :product, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
