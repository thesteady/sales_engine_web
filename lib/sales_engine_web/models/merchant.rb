require './lib/sales_engine_web/models/database'

module SalesEngineWeb
  class Merchant
    attr_reader :id, :name

    extend Helper

    has_many :invoices
    has_many :items

    def initialize(params)
      @id = params[:id]
      @name = params[:name]
    end

    def save
      @id = Merchant.add(self)
      self
    end

     def self.table
      Database.merchants
    end

    def to_hash
      { :id => id, :name => name}
    end

    def self.find_and_instantiate(&block)
      result = block.call
      Merchant.new(result) if result
    end

    def self.find_by_name(name)
      find_and_instantiate do
        table.limit(1).where(Sequel.ilike(:name, "%#{name}%")).first
      end
    end

    def self.find_all_by_name(name)
      results = table.where(Sequel.ilike(:name, "%#{name}%")).to_a
      results.collect {|result| new(result)}
    end

    def to_json(state = nil)
      {:id => id, :name => name}.to_json
    end
  end
end
