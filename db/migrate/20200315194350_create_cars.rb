class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.references :estate, index: true, foreign_key: true
      t.string :model
      t.string :reg_number

      t.timestamps null: false
    end
  end
end
