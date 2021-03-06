module SalesEngineWeb
  class Transaction
    attr_reader :id, :invoice_id, :credit_card_number,
                :credit_card_expiration, :result

    extend Helper

    def initialize(params)
      @id = params[:id]
      @invoice_id = params[:invoice_id]
      @credit_card_number = params[:credit_card_number]
      @credit_card_expiration = params[:credit_card_expiration_date]
      @result = params[:result]
    end

    def save
      @id = Transaction.add(self)
      self
    end

    def to_hash
      {
        id: id, invoice_id: invoice_id, credit_card_number: credit_card_number,
        credit_card_expiration: credit_card_expiration, result: result
      }
    end

    def to_json(state = nil)
      {
        id: id, invoice_id: invoice_id, credit_card_number: credit_card_number,
        credit_card_expiration: credit_card_expiration, result: result
      }.to_json
    end

    def self.table
       Database.transactions
    end

    def self.find_by_invoice_id(invoice_id)
      result = table.limit(1).where(invoice_id: invoice_id).first
      new(result) if result
    end

    def self.find_all_by_invoice_id(invoice_id)
      results = table.where(invoice_id: invoice_id.to_i).to_a
      results.collect{|result| new(result)}
    end

    def self.find_all_by_customer_id(customer_id)
      invoices = Invoice.find_all_by_customer_id(customer_id)
      invoices.collect {|invc| Transaction.find_all_by_invoice_id(invc.id)}
    end
  end
end
