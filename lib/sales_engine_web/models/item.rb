module SalesEngineWeb
  class Item
    attr_reader :id, :name, :description, :unit_price, :merchant_id

    extend Helper

    def initialize(params)
      @id = params[:id]
      @name = params[:name]
      @description = params[:description]
      @unit_price = params[:unit_price]
      @merchant_id = params[:merchant_id]
    end

    def save
      @id = Item.add(self)
      self
    end

    def to_hash
      {
        id: id, name: name, description: description,
        unit_price: unit_price, merchant_id: merchant_id
      }
    end

    def to_json(state = nil)
      {
        id: id, name: name, description: description,
        unit_price: unit_price, merchant_id: merchant_id
      }.to_json
    end

    def self.table
       Database.items
    end

    def self.find_by_name(name)
      result = table.limit(1).where(Sequel.ilike(:name, "%#{name}%")).first
      new(result) if result
    end

    def self.find_by_description(description)
      result = table.limit(1).where(
                                Sequel.ilike(:description, "%#{description}%")
                                ).first
      new(result) if result
    end

    def self.find_by_merchant_id(merchant_id)
      result = table.limit(1).where(merchant_id: merchant_id).first
      new(result) if result
    end

    def self.find_all_by_name(name)
      results = table.where(Sequel.ilike(:name, "%#{name}")).to_a
      results.collect {|result| new(result)}
    end

    def self.find_all_by_merchant_id(merchant_id)
      results = table.where(merchant_id: merchant_id).to_a
      results.collect {|result| new(result)}
    end

    def self.find_all_by_description(description)
      results = table.where(Sequel.ilike(:description, "%#{description}")).to_a
      results.collect {|result| new(result)}
    end
  end
end
