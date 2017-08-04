class AddSectionToEstate < ActiveRecord::Migration
  def change
    add_column :estates, :section, :integer
  end
end
