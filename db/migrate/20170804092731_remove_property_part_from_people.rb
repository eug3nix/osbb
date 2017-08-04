class RemovePropertyPartFromPeople < ActiveRecord::Migration
  def change
    remove_column :people, :property_part, :integer
  end
end
