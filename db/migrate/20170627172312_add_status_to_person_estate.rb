class AddStatusToPersonEstate < ActiveRecord::Migration
  def change
    add_reference :person_estates, :person_estate_status, index: true, foreign_key: true
  end
end
