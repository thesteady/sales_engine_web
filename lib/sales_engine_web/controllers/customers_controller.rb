module SalesEngineWeb
  class CustomersController

    def self.find(params)
      if params[:id]
        customer = Customer.find(params[:id])
      elsif params[:first_name]
        customer = Customer.find_by_first_name(params[:first_name])
      else #params[:last_name]
        customer = Customer.find_by_last_name(params[:last_name])
      end
      Response.new(:body => customer.to_json)
    end

    def self.find_all(params)
      if params[:first_name]
        customers = Customer.find_all_by_first_name(params[:first_name])
      else #params[:last_name]
        customers = Customer.find_all_by_last_name(params[:last_name])
      end
      Response.new(:body => customers.to_json)
    end

    def self.random
      Response.new(:body => Customer.random.to_json)
    end

    def self.invoices(id)
      Response.new(:body => Customer.find(id).invoices.to_json)
    end

    def self.transactions(id)
      transacts = Customer.find(id).transactions
      Response.new(:body => transacts.to_json)
    end
  end
end
