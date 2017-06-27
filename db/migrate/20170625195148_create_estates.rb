class CreateEstates < ActiveRecord::Migration
  def change
    create_table :estates do |t|
      t.string :name, null: false
      t.integer :floor
      t.integer :rooms
      t.integer :total_area
      t.integer :living_area
      t.integer :regnum
      t.references :estate_type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
