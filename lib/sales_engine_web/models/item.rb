module SalesEngineWeb
  class Item
    attr_reader :id, :name, :description, :unit_price, :merchant_id

    def initialize(params)
      @id = params[:id]
      @name = params[:name]
      @description = params[:description]
      @unit_price = params[:unit_price]
      @merchant_id = params[:merchant_id]
    end

    def self.create(params)
      Item.new(params).save
    end

    def save
      @id = Item.add(self)
      self
    end

    def self.add(item)
      items.insert(item.to_hash)
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

    def self.items
       Database.items
    end

    def self.find(id)
      result = items.limit(1).where(:id => id.to_i).first
      new(result) if result
    end

    def self.find_by_name(name)
      result = items.limit(1).where(Sequel.ilike(:name, "%#{name}%")).first
      new(result) if result
    end

    def self.find_by_description(description)
      result = items.limit(1).where(Sequel.ilike(:description, "%#{description}%")).first
      new(result) if result
    end

    def self.find_by_merchant_id(merchant_id)
      result = items.limit(1).where(merchant_id: merchant_id).first
      new(result) if result
    end

    def self.find_all_by_name(name)
      results = items.where(Sequel.ilike(:name, "%#{name}")).to_a
      results.collect {|result| new(result)}
    end

    def self.find_all_by_description(description)
      results = items.where(Sequel.ilike(:description, "%#{description}")).to_a
      results.collect {|result| new(result)}
    end
  end
end
