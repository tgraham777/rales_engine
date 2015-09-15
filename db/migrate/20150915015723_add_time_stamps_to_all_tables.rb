class AddTimeStampsToAllTables < ActiveRecord::Migration
  def change
    %i(customers invoice_items transactions items merchants invoices).each do |table_name|
      add_column table_name, :created_at, :datetime
      add_column table_name, :updated_at, :datetime
    end
  end
end
