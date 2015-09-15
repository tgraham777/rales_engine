require 'csv'

desc "Import data from csv file"
task :import => [:environment] do

  customer_file = "db/csv/customers.csv"
  invoice_item_file = "db/csv/invoice_items.csv"
  invoice_file = "db/csv/invoices.csv"
  item_file = "db/csv/items.csv"
  merchant_file = "db/csv/merchants.csv"
  transaction_file = "db/csv/transactions.csv"

  CSV.foreach(customer_file, :headers => true) do |row|
    Customer.create(row.to_hash.except('id'))
  end

  CSV.foreach(merchant_file, :headers => true) do |row|
    Merchant.create(row.to_hash.except('id'))
  end

  CSV.foreach(invoice_file, :headers => true) do |row|
    Invoice.create(row.to_hash.except('id'))
  end

  CSV.foreach(item_file, :headers => true) do |row|
    Item.create(row.to_hash.except('id'))
  end

  CSV.foreach(invoice_item_file, :headers => true) do |row|
    InvoiceItem.create(row.to_hash.except('id'))
  end

  CSV.foreach(transaction_file, :headers => true) do |row|
    Transaction.create(row.to_hash.except('id', 'credit_card_expiration_date'))
  end
end
