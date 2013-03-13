Sequel.migration do
  change do
    create_table :invoices do
      primary_key :id
      foreign_key :customer_id, :customers
      foreign_key :merchant_id, :merchants
      Datetime :created_at
      Datetime :updated_at
    end
  end
end
