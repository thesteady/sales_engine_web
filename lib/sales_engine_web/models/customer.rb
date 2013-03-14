module SalesEngineWeb
  class Customer
    attr_reader :id, :first_name, :last_name

    extend Helper
    has_many :invoices
    has_many :transactions

    def initialize(params)
      @id = params[:id]
      @first_name = params[:first_name]
      @last_name = params[:last_name]
    end

    def save
      @id = Customer.add(self)
      self
    end

    def to_hash
      {id: id, first_name: first_name, last_name: last_name}
    end

    def to_json(state = nil)
      {id: id, first_name: first_name, last_name: last_name}.to_json
    end

    def self.table
       Database.customers
    end

     def self.find_and_instantiate(&block)
      result = block.call
      Customer.new(result) if result
    end

    def self.find_by_first_name(first_name)
      find_and_instantiate do
        table.limit(1).where(Sequel.ilike(:first_name,"%#{first_name}%")).first
      end
    end

    def self.find_by_last_name(last_name)
      find_and_instantiate do
        table.limit(1).where(Sequel.ilike(:last_name, "%#{last_name}%")).first
      end
    end

    def self.find_all_by_first_name(first_name)
      results = table.where(Sequel.ilike(:first_name, "%#{first_name}%"))
      collection = results.collect {|result| new(result)}
    end

    def self.find_all_by_last_name(last_name)
      results = table.where(Sequel.ilike(:last_name, "%#{last_name}%"))
      collection = results.collect {|result| new(result)}
    end
  end
end
