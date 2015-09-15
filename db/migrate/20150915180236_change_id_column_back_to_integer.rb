class ChangeIdColumnBackToInteger < ActiveRecord::Migration
  def change
    change_column :customers, :id, :integer
    change_column :invoices, :id, :integer
    change_column :invoice_items, :id, :integer
    change_column :items, :id, :integer
    change_column :merchants, :id, :integer
    change_column :transactions, :id, :integer
  end
end
