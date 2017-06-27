class CreatePersonEstates < ActiveRecord::Migration
  def change
    create_table :person_estates do |t|
      t.references :person, index: true, foreign_key: true
      t.references :estate, index: true, foreign_key: true
      t.references :status, index: true, foreign_key: true
      t.integer :regno
      t.datetime :regdate

      t.timestamps null: false
    end
  end
end
