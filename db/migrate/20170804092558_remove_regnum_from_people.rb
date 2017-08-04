class RemoveRegnumFromPeople < ActiveRecord::Migration
  def change
    remove_column :people, :regnum, :integer
  end
end
