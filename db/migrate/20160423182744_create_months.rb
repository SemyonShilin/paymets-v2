class CreateMonths < ActiveRecord::Migration
  def change
    create_table :months do |t|
      t.string :name_month, null: false

      t.timestamps null: false
    end

    create_table :months_years, id: false do |t|
      t.belongs_to :month, index: true
      t.belongs_to :year, index: true
    end
  end
end
