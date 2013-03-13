Sequel.migration do
  change do
    create_table  :transactions do
      primary_key :id
      foreign_key :invoice_id
      String      :credit_card_number
      String      :credit_card_expiration
      String      :result
      Datetime    :created_at
      Datetime    :updated_at
    end
  end
end
