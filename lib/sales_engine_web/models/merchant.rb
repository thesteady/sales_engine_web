require './lib/sales_engine_web/models/database'

module SalesEngineWeb
  class Merchant
    attr_reader :id, :name

    def initialize(params)
      @id = params[:id]
      @name = params[:name]
    end

    def self.create(params)
      Merchant.new(params).save
    end

    def save
      @id = Merchant.add(self)
      self
    end

    def self.add(merchant)
      merchants.insert(merchant.to_hash)
    end

    def to_hash
      { :id => id, :name => name}
    end

    def self.find_and_instantiate(&block)
      result = block.call
      Merchant.new(result) if result
    end

    def self.find(id)
      find_and_instantiate{ merchants.where(:id => id.to_i).limit(1).first }
    end

    def self.find_by_name(name)
      find_and_instantiate do
        merchants.limit(1).where(Sequel.ilike(:name, "%#{name}%")).first
      end
    end

    def self.find_all_by_name(name)
      results = merchants.where(Sequel.ilike(:name, "%#{name}%")).to_a
      results.collect {|result| new(result)}
    end

    def to_json(state = nil)
      {:id => id, :name => name}.to_json
    end

    def self.random
      find_and_instantiate { merchants.to_a.sample }
    end

    def self.merchants
      Database.merchants
    end
  end
end
