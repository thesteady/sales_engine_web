module SalesEngineWeb
  class Server < Sinatra::Base

################### MERCHANTS ##################
    get '/merchants/find' do
      status 200
      if params[:id]
        merchant = Merchant.find(params[:id])
      else
        merchant = Merchant.find_by_name(params[:name])
      end
      body merchant.to_json
    end

    get '/merchants/find_all' do
      status 200
      # if params[:name]
      merchants = Merchant.find_all_by_name(params[:name])
      body merchants.to_json
    end

    get '/merchants/random' do
      Merchant.random.to_json
    end

    get '/merchants/:id/items' do
      merchant = Merchant.find(params[:id])
      items = Item.find_all_by_merchant_id(merchant.id)
      body items.to_json
    end

    get '/merchants/:id/invoices' do
      merchant = Merchant.find(params[:id])
      invoices = Invoice.find_all_by_merchant_id(merchant.id)
      body invoices.to_json
    end


########### INVOICES #######################
    get '/invoices/find' do
      if params[:id]
        invoice = Invoice.find(params[:id])
      elsif params[:customer_id]
        invoice = Invoice.find_by_customer_id(params[:customer_id])
      else #params[:merchant_id]
        invoice = Invoice.find_by_merchant_id(params[:merchant_id])
      end
      body invoice.to_json
    end

    get '/invoices/find_all' do
      if params[:customer_id]
        invoices = Invoice.find_all_by_customer_id(params[:customer_id])
      else #params[:merchant_id]
        invoices = Invoice.find_all_by_merchant_id(params[:merchant_id])
      end
      body invoices.to_json
    end

    get '/invoices/random' do
      invoice = Invoice.random
      body invoice.to_json
    end

    get '/invoices/:id/transactions' do
      transacts = Transaction.find_all_by_invoice_id(params[:id])
      body transacts.to_json
    end

    get '/invoices/:id/customer' do
     invoice = Invoice.find(params[:id])
     customer = Customer.find(invoice.customer_id)
     body customer.to_json
    end

    get '/invoices/:id/merchant' do
     invoice = Invoice.find(params[:id])
     merchant = Merchant.find(invoice.merchant_id)
     body merchant.to_json
    end

    get '/invoices/:id/invoice_items' do
      inv_items = InvoiceItem.find_all_by_invoice_id(params[:id])
      body inv_items.to_json
    end

    get '/invoices/:id/items' do
      inv_items = InvoiceItem.find_all_by_invoice_id(params[:id])
      items = inv_items.collect {|inv_item| Item.find(inv_item.item_id)}
      body items.to_json
    end

############## CUSTOMERS ##############
    get '/customers/find' do
      if params[:id]
        customer = Customer.find(params[:id])
      elsif params[:first_name]
        customer = Customer.find_by_first_name(params[:first_name])
      else #params[:last_name]
        customer = Customer.find_by_last_name(params[:last_name])
      end
      body customer.to_json
    end

    get '/customers/find_all' do
      if params[:first_name]
        customers = Customer.find_all_by_first_name(params[:first_name])
      else #params[:last_name]
        customers = Customer.find_all_by_last_name(params[:last_name])
      end
      body customers.to_json
    end

    get '/customers/random' do
      customer = Customer.random
      body customer.to_json
    end

    get '/customers/:id/invoices' do
      customer = Customer.find(params[:id])
      invoices = Invoice.find_all_by_customer_id(customer.id)
      body invoices.to_json
    end

    get '/customers/:id/transactions' do
      customer = Customer.find(params[:id])
      invoices = Invoice.find_all_by_customer_id(customer.id)
      transacts = invoices.collect do |invoice|
        Transaction.find_all_by_invoice_id(invoice.id)
      end
      body transacts.to_json
    end

################## ITEMS ###############
    get '/items/find' do
      if params[:id]
        item = Item.find(params[:id])
      elsif params[:name]
        item = Item.find_by_name(params[:name])
      elsif params[:description]
        item = Item.find_by_description(params[:description])
      else
        item = Item.find_by_merchant_id(params[:merchant_id])
      end
      body item.to_json
    end

    get '/items/find_all' do
      if params[:name]
        items = Item.find_all_by_name(params[:name])
      elsif params[:description]
        items = Item.find_all_by_description(params[:description])
      else #params[:merchant_id]
        items = Item.find_all_by_merchant_id(params[:merchant_id])
      end
      body items.to_json
    end

    get '/items/random' do
      item = Item.random
      body item.to_json
    end

    get '/items/:id/merchant' do
      item = Item.find(params[:id])
      merchant = Merchant.find(item.merchant_id)
      body merchant.to_json
    end

################# TRANSACTIONS ###############
    get '/transactions/find' do
      if params[:id]
        transact = Transaction.find(params[:id])
      else
        transact = Transaction.find_by_invoice_id(params[:invoice_id])
      end
      body transact.to_json
    end

    get '/transactions/find_all' do
      if params[:invoice_id]
        puts params[:invoice_id].inspect
        transacts = Transaction.find_all_by_invoice_id(params[:invoice_id])
      else
        puts "WHATTTTTT"
      end
      body transacts.to_json
    end

    get '/transactions/random' do
      transact = Transaction.random
      body transact.to_json
    end

    get '/transactions/:id/invoice' do
      transact = Transaction.find(params[:id])
      invoice = Invoice.find(transact.invoice_id)
      body invoice.to_json
    end
################## INVOICE ITEMS ##############
    get '/invoice_items/find' do
      if params[:id]
        inv_item = InvoiceItem.find(params[:id])
      elsif params[:item_id]
        inv_item = InvoiceItem.find_by_item_id(params[:item_id])
      else #params[:invoice_id]
        inv_item = InvoiceItem.find_by_invoice_id(params[:invoice_id])
      end
      body inv_item.to_json
    end

    get '/invoice_items/find_all' do
      if params[:item_id]
        inv_items = InvoiceItem.find_all_by_item_id(params[:item_id])
      else #params[:invoice_id]
        inv_items = InvoiceItem.find_all_by_invoice_id(params[:invoice_id])
      end
      body inv_items.to_json
    end

    get '/invoice_items/:id/invoice' do
      inv_item = InvoiceItem.find(params[:id])
      invoice = Invoice.find(inv_item.invoice_id)
      body invoice.to_json
    end

    get '/invoice_items/:id/item' do
      inv_item = InvoiceItem.find(params[:id])
      item = Item.find(inv_item.item_id)
      body item.to_json
    end

    get '/invoice_items/random' do
      inv_item = InvoiceItem.random
      body inv_item.to_json
    end
  end
end
