module SalesEngineWeb
  class Server < Sinatra::Base

    def respond_with(response)
      status(response.status)
      body(response.body)
    end
################### MERCHANTS ##################
    get '/merchants/random' do
      Merchant.random.to_json
      respond_with MerchantsController.random
    end

    get '/merchants/find' do
      respond_with MerchantsController.find(params)
    end

    get '/merchants/find_all' do
      respond_with MerchantsController.find_all(params[:name])
    end

    get '/merchants/:id/items' do
      respond_with MerchantsController.find_items(params[:id])
    end

    get '/merchants/:id/invoices' do
      respond_with MerchantsController.find_invoices(params[:id])
    end

########### INVOICES #######################
    get '/invoices/find' do
      respond_with InvoicesController.find(params)
    end

    get '/invoices/find_all' do
      respond_with InvoicesController.find_all(params)
    end

    get '/invoices/random' do
      respond_with InvoicesController.random
    end

    get '/invoices/:id/transactions' do
      respond_with InvoicesController.transactions(params[:id])
    end

    get '/invoices/:id/customer' do
     respond_with InvoicesController.customer(params[:id])
    end

    get '/invoices/:id/merchant' do
     respond_with InvoicesController.merchant(params[:id])
    end

    get '/invoices/:id/invoice_items' do
      respond_with InvoicesController.invoice_items(params[:id])
    end

    get '/invoices/:id/items' do
      respond_with InvoicesController.items(params[:id])
    end

############## CUSTOMERS ##############
    get '/customers/find' do
      respond_with CustomersController.find(params)
    end

    get '/customers/find_all' do
      respond_with CustomersController.find_all(params)
    end

    get '/customers/random' do
      respond_with CustomersController.random
    end

    get '/customers/:id/invoices' do
      respond_with CustomersController.invoices(params[:id])
    end

    get '/customers/:id/transactions' do
      respond_with CustomersController.transactions(params[:id])
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
      else params[:description]
        items = Item.find_all_by_description(params[:description])
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

    get '/items/:id/invoice_items' do
      invoice_item = InvoiceItem.find_all_by_item_id(params[:id])
      body invoice_item.to_json
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
      # params[:invoice_id]
      transacts = Transaction.find_all_by_invoice_id(params[:invoice_id])
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
