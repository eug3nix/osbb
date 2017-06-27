class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :firstname, null: false
      t.string :lastname, null: false
      t.string :middlename
      t.integer :inn
      t.references :person_type, index: true, foreign_key: true
      t.integer :regnum
      t.datetime :regdate
      t.integer :property_part
      t.date :birthdate
      t.boolean :notifiable
      t.date :move_in_date

      t.timestamps null: false
    end
  end
end
