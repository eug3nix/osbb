class RemoveRegdateFromPeople < ActiveRecord::Migration
  def change
    remove_column :people, :regdate, :datetime
  end
end
