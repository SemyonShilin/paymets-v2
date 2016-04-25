class CreatePayments < ActiveRecord::Migration
  def change
    create_table :payments do |t|
      t.decimal :payment, precision: 8, scale: 2
      t.decimal :other_payment, precision: 8, scale: 2
      t.text :description

      t.references :month, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
