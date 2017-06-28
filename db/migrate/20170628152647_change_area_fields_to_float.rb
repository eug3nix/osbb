class ChangeAreaFieldsToFloat < ActiveRecord::Migration
  def change
    change_column :estates, :total_area, :float
    change_column :estates, :living_area, :float
  end
end
