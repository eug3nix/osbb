class RemoveStatusFromPersonEstate < ActiveRecord::Migration
  def change
    remove_column :person_estates, :status_id
  end
end
