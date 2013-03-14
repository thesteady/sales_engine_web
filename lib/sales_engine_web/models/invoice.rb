module SalesEngineWeb
  class Invoice
    attr_reader :id, :customer_id, :merchant_id

    extend Helper

    def initialize(params)
      @id = params[:id]
      @customer_id = params[:customer_id]
      @merchant_id = params[:merchant_id]
    end

    def save
      @id = Invoice.add(self)
      self
    end

    def to_hash
      {id: id, customer_id: customer_id, merchant_id: merchant_id }
    end

    def to_json(state = nil)
      {id: id, customer_id: customer_id, merchant_id: merchant_id}.to_json
    end

    def self.table
       Database.invoices
    end

    def self.find_by_customer_id(customer_id)
      result = table.limit(1).where(:customer_id => customer_id.to_i).first
      new(result) if result
    end

    def self.find_by_merchant_id(merchant_id)
      result = table.limit(1).where(:merchant_id => merchant_id.to_i).first
      new(result) if result
    end

    def self.find_all_by_customer_id(customer_id)
      results = table.where(:customer_id =>customer_id.to_i).to_a
      ans = results.collect {|result| new(result)}
      ans.flatten
    end

    def self.find_all_by_merchant_id(merchant_id)
      results = table.where(:merchant_id => merchant_id.to_i).to_a
      ans = results.collect{|result| new(result)}
      ans.flatten
    end
  end
end

