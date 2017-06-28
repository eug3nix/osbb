class AddPartToPersonEstate < ActiveRecord::Migration
  def change
    add_column :person_estates, :part, :float
  end
end
