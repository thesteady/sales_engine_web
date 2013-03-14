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

    def self.add(customer)
      customers.insert(customer.to_hash)
    end

    def to_hash
      {id: id, first_name: first_name, last_name: last_name}
    end

    def to_json(state = nil)
      {id: id, first_name: first_name, last_name: last_name}.to_json
    end

    def self.customers
       Database.customers
    end

    def self.find(id)
      result = customers.limit(1).where(:id => id.to_i).first
      new(result) if result
    end

    def self.find_by_first_name(first_name)
      result = customers.limit(1).where(Sequel.ilike(:first_name, "%#{first_name}%")).first
      new(result) if result
    end

    def self.find_by_last_name(last_name)
      result = customers.limit(1).where(Sequel.ilike(:last_name, "%#{last_name}%")).first
      new(result) if result
    end

    def self.find_all_by_first_name(first_name)
      results = customers.where(Sequel.ilike(:first_name, "%#{first_name}%"))
      collection = results.collect {|result| new(result)}
    end

    def self.find_all_by_last_name(last_name)
      results = customers.where(Sequel.ilike(:last_name, "%#{last_name}%"))
      collection = results.collect {|result| new(result)}
    end

    def self.random
      result = customers.to_a.sample
      new(result) if result
    end
  end
end
