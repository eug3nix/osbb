class AddRegReasonToPersonEstate < ActiveRecord::Migration
  def change
    add_column :person_estates, :reg_reason, :string, limit: 300
  end
end
