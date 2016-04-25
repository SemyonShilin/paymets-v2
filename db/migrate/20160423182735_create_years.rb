class CreateYears < ActiveRecord::Migration
  def change
    create_table :years do |t|
      t.string :value_year, null: false

      t.timestamps null: false
    end
  end
end
