module SalesEngineWeb
  class MerchantsController
    def self.find(params)
      if params[:id]
        merchant = Merchant.find(params[:id])
      else #params[:name]
        merchant = Merchant.find_by_name(params[:name])
      end
      Response.new(:body => merchant.to_json)
    end

    def self.find_all(name)
      merchants = Merchant.find_all_by_name(name)
      Response.new(:body =>merchants.to_json)
    end

    def self.find_items(id)
      items = Merchant.find(id).items
      Response.new(:body => items.to_json)
    end

    def self.find_invoices(id)
      invoices = Merchant.find(id).invoices
      Response.new(:body => invoices.to_json)
    end

    def self.random
      merchant = Merchant.random
      Response.new(:body => merchant.to_json)
    end
  end
end
