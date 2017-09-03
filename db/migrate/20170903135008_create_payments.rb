class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.references :estate, index: true, foreign_key: true
      t.date :pay_date
      t.decimal :amount
      t.string :payment_type

      t.timestamps null: false
    end
  end
end
