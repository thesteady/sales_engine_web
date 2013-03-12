module SalesEngineWeb
  class Invoice
    attr_reader :id, :customer_id, :merchant_id

    def initialize(params)
      @id = params[:id]
      @customer_id = params[:customer_id]
      @merchant_id = params[:merchant_id]
    end

    def self.create(params)
      Invoice.new(params).save
    end

    def save
      @id = Invoice.add(self)
      self
    end

    def self.add(invoice)
      invoices.insert(invoice.to_hash)
    end

    def to_hash
      {id: id, customer_id: customer_id, merchant_id: merchant_id }
    end

    def to_json(state = nil)
      {id: id, customer_id: customer_id, merchant_id: merchant_id}.to_json
    end

    def self.invoices
       Database.invoices
       # @invoices ||= []
    end

    def self.find(id)
      result = invoices.limit(1).where(:id => id.to_i).first
      new(result) if result
    end

    def self.find_by_customer_id(customer_id)
      result = invoices.limit(1).where(:customer_id => customer_id.to_i).first
      new(result) if result
    end

    def self.find_by_merchant_id(merchant_id)
      result = invoices.limit(1).where(:merchant_id => merchant_id.to_i).first
      new(result) if result
    end

  end
end

