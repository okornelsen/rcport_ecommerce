ActiveAdmin.register Product do
  permit_params :name, :price, :sku, :description, :part_no, :brand, :terrain_type, :drive_train, :scale, :pricetype_id, :saleprice, productcategories_attributes: %i[id product_id category_id _destroy]

  index do
    selectable_column
    column :name
    column :price
    column :sku
    column :pricetype_id
    column :saleprice
    column :categories do |product|
      product.categories.map { |p| p.vehicle_type }.join(", ").html_safe
    end
    actions
  end

  show do |product|
    attributes_table do
      row :name
      row :price
      row :sku
      row :description
      row :part_no
      row :brand
      row :terrain_type
      row :drive_train
      row :scale
      row :pricetype_id
      row :saleprice
      row :categories do |product|
        product.categories.map { |p| p.vehicle_type }.join(", ").html_safe
      end
    end
  end

  form do |f|
    f.semantic_errors(*f.object.errors.keys)

    f.inputs "Product" do
      f.input :name
      f.input :price
      f.input :sku
      f.input :description
      f.input :part_no
      f.input :brand
      f.input :terrain_type
      f.input :drive_train
      f.input :scale
      f.input :pricetype_id
      f.input :saleprice
      f.has_many :productcategories, allow_destroy: true do |nf|
        nf.input :category
      end
    end

    f.actions
  end
end
