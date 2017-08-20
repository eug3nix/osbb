class RemoveTypeFromContact < ActiveRecord::Migration
  def change
    remove_column :contacts, :type_id, :integer
  end
end
