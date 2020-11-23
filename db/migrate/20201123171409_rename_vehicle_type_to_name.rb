class RenameVehicleTypeToName < ActiveRecord::Migration[6.0]
  def change
    rename_column :categories, :vehicle_type, :name
  end
end
