class RemovePersonTypeIdFromPeople < ActiveRecord::Migration
  def change
  	remove_column :people, :person_type_id, :references
  end
end
