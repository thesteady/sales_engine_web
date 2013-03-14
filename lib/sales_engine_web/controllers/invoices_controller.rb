module SalesEngineWeb
  class InvoicesController

    def self.find(params)
      if params[:id]
        invoice = Invoice.find(params[:id])
      elsif params[:customer_id]
        invoice = Invoice.find_by_customer_id(params[:customer_id])
      else #params[:merchant_id]
        invoice = Invoice.find_by_merchant_id(params[:merchant_id])
      end
      Response.new(:body =>invoice.to_json)
    end

    def self.find_all(params)
      if params[:customer_id]
        invoices = Invoice.find_all_by_customer_id(params[:customer_id])
      else #params[:merchant_id]
        invoices = Invoice.find_all_by_merchant_id(params[:merchant_id])
      end
      Response.new(:body =>invoices.to_json)
    end

    def self.random
      invoice = Invoice.random
      Response.new(:body => invoice.to_json)
    end

    def self.transactions(id)
      transacts = Transaction.find_all_by_invoice_id(id)
      Response.new(:body => transacts.to_json)
    end

    def self.customer(id)
      invoice = Invoice.find(id)
      customer = Customer.find(invoice.customer_id)
      Response.new(:body => customer.to_json)
    end

    def self.merchant(id)
      invoice = Invoice.find(id)
      merchant = Merchant.find(invoice.merchant_id)
      Response.new(:body => merchant.to_json)
   end

    def self.invoice_items(id)
      inv_items = InvoiceItem.find_all_by_invoice_id(id)
      Response.new(:body => inv_items.to_json)
    end

    def self.items(id)
      inv_items = InvoiceItem.find_all_by_invoice_id(id)
      items = inv_items.collect {|inv_item| Item.find(inv_item.item_id)}
      Response.new(:body => items.to_json)
    end
  end
end
