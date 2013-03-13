Sequel.migration do
  change do
    create_table  :invoice_items do
      primary_key :id
      foreign_key :item_id, :items
      foreign_key :invoice_id, :invoices
      Integer     :quantity
      Integer     :unit_price
      Datetime    :created_at
      Datetime    :updated_at
    end
  end
end
