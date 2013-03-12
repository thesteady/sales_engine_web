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

############## CUSTOMERS ##############
    get '/customers/find' do
      customer = Customer.find(params[:id])
      body customer.to_json
    end
  end
end
