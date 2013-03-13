module SalesEngineWeb
  class InvoiceItem
    attr_reader :id, :item_id, :invoice_id, :quantity, :unit_price

    def initialize(params)
      @id = params[:id]
      @invoice_id = params[:invoice_id]
      @item_id = params[:item_id]
      @unit_price = params[:unit_price]
      @quantity = params[:quantity]
    end

    def self.create(params)
      InvoiceItem.new(params).save
    end

    def save
      @id = InvoiceItem.add(self)
      self
    end

    def self.add(invoice_item)
      invoice_items.insert(invoice_item.to_hash)
    end

    def to_hash
      {
        id: id, item_id: item_id, invoice_id: invoice_id,
        quantity: quantity, unit_price: unit_price
      }
    end

   def to_json(state = nil)
      {
        id: id, item_id: item_id, invoice_id: invoice_id,
        quantity: quantity, unit_price: unit_price
      }.to_json
    end

    def self.invoice_items
       Database.invoice_items
    end

    def self.find(id)
      result = invoice_items.limit(1).where(:id => id.to_i).first
      new(result) if result
    end

    def self.find_by_invoice_id(invoice_id)
      result = invoice_items.limit(1).where(invoice_id: invoice_id).first
      new(result) if result
    end

    def self.find_by_item_id(item_id)
      result = invoice_items.limit(1).where(item_id: item_id).first
      new(result) if result
    end

    def self.find_all_by_item_id(item_id)
      results = invoice_items.where(item_id: item_id).to_a
      results.collect {|result| new(result)}
    end

    def self.find_all_by_invoice_id(invoice_id)
      results = invoice_items.where(invoice_id: invoice_id).to_a
      results.collect {|result| new(result)}
    end

    def self.random
      result = invoice_items.to_a.sample
      new(result) if result
    end
  end
end
