class CreateProductscategories < ActiveRecord::Migration[6.0]
  def change
    create_table :productscategories do |t|
      t.references :products, null: false, foreign_key: true
      t.references :category, null: false, foreign_key: true

      t.timestamps
    end
  end
end
