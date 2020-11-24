class RenameImageToImageFile < ActiveRecord::Migration[6.0]
  def change
    rename_column :products, :image, :image_file
  end
end
