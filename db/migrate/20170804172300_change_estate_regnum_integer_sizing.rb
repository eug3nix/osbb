class ChangeEstateRegnumIntegerSizing < ActiveRecord::Migration
  def change
  	change_column :estates, :regnum, :integer, limit: 8
  end
end
