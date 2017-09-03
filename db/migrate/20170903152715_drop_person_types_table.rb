class DropPersonTypesTable < ActiveRecord::Migration
  def up
    drop_table :person_types
  end

  def down
    fail ActiveRecord::IrreversibleMigration
  end
end
