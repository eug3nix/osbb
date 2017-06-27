class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.references :person, index: true, foreign_key: true, null: false
      t.string :value, null: false
      t.boolean :private, default: false
      t.references :type, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
