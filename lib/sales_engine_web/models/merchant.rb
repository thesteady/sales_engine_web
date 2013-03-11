module SalesEngineWeb
  class Merchant
    attr_reader :id, :name

    def initialize(params)
      @id = params[:id]
      @name = params[:name]
    end

    def self.create(params)
      merchant = Merchant.new(params)
      merchants << merchant
      merchant
    end

    def self.find(id)
      merchants.find{|m| m.id == id.to_i}
    end

    def to_json
      {:id => id, :name => name}.to_json
    end

  private
    def self.merchants
      @merchants ||= []
    end
  end
end