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
  end
end
