class AddDebitToPayments < ActiveRecord::Migration
  def change
    add_column :payments, :debit, :decimal
  end
end
