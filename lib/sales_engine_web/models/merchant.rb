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

    def self.find_by_name(name)
      merchants.find{|m| m.name.downcase == name.downcase}
    end

    def to_json
      {:id => id, :name => name}.to_json
    end

    def self.random_sequence=(input)
      @random_sequence = input
    end

    def self.random_sequence
      @random_sequence || []
    end

    def self.random
      merchants.sample
    end

    def self.merchants
      @merchants ||= []
    end
  end
end