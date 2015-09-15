class ChangeIdTypeToBigInt < ActiveRecord::Migration
  def change
    change_column :customers, :id, :bigint
    change_column :invoices, :id, :bigint
    change_column :invoice_items, :id, :bigint
    change_column :items, :id, :bigint
    change_column :merchants, :id, :bigint
    change_column :transactions, :id, :bigint
  end
end
