module SalesEngineWeb
  class InvoiceItem
    attr_reader :id, :item_id, :invoice_id, :quantity, :unit_price

    def initialize(params)
      @id = params[:id]
      @invoice_id = params[:invoice_id]
      @item_id = params[:item_id]
      @unit_price = params[:unit_price]
      @quantity = params[:quantity]
    end

#     def self.create(params)
#       Item.new(params).save
#     end

#     def save
#       @id = Item.add(self)
#       self
#     end

#     def self.add(item)
#       items.insert(item.to_hash)
#     end

#     def to_hash
#       {
#         id: id, name: name, description: description,
#         unit_price: unit_price, merchant_id: merchant_id
#       }
#     end

#     def to_json(state = nil)
#       {
#         id: id, name: name, description: description,
#         unit_price: unit_price, merchant_id: merchant_id
#       }.to_json
#     end

#     def self.items
#        Database.items
#     end

#     def self.find(id)
#       result = items.limit(1).where(:id => id.to_i).first
#       new(result) if result
#     end

#     def self.find_by_name(name)
#       result = items.limit(1).where(Sequel.ilike(:name, "%#{name}%")).first
#       new(result) if result
#     end

#     def self.find_by_description(description)
#       result = items.limit(1).where(Sequel.ilike(:description, "%#{description}%")).first
#       new(result) if result
#     end

#     def self.find_by_merchant_id(merchant_id)
#       result = items.limit(1).where(merchant_id: merchant_id).first
#       new(result) if result
#     end

#     def self.find_all_by_name(name)
#       results = items.where(Sequel.ilike(:name, "%#{name}")).to_a
#       results.collect {|result| new(result)}
#     end

#     def self.find_all_by_description(description)
#       results = items.where(Sequel.ilike(:description, "%#{description}")).to_a
#       results.collect {|result| new(result)}
#     end

#     def self.random
#       result = items.to_a.sample
#       new(result) if result
#     end
  end
end
