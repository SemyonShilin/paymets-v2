class ChangeMonthId < ActiveRecord::Migration
  def change
    change_column_null :payments, :month_id, false
  end
end
