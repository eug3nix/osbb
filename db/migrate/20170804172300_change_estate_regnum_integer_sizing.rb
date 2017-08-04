class ChangeEstateRegnumIntegerSizing < ActiveRecord::Migration
  def change
  	change_column :estates, :regnum, :integer, limit: 16
  end
end
