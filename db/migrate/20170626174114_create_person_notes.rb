class CreatePersonNotes < ActiveRecord::Migration
  def change
    create_table :person_notes do |t|
      t.string :text
      t.references :person, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
