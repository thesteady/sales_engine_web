require 'spec_helper'

describe "/customers/" do
  include Rack::Test::Methods
  include_context 'standard output'

  def app
    SalesEngineWeb::Server
  end

  before(:each) do
    customer1 && customer2
  end

  let(:customer1) {SalesEngineWeb::Customer.create(:first_name => 'Jerry', :last_name => 'Seinfeld')}
  let(:customer2) {SalesEngineWeb::Customer.create(:first_name => 'Meryl', :last_name => 'Streep')}
  let(:customer3) {SalesEngineWeb::Customer.create(:first_name => 'Whoopi', :last_name => 'Goldberg')}
  let(:customer4) {SalesEngineWeb::Customer.create(:first_name => 'Jerry', :last_name => 'Springer')}
  let(:customer5) {SalesEngineWeb::Customer.create(:first_name => 'Sam', :last_name => 'Springer')}

  describe '/customers/find' do
    context 'given a customer id' do
      it 'returns the customer instance with that id' do
        get "/customers/find?id=#{customer1.id}"
        expect(output['id']).to eq customer1.id
        expect(output['first_name']).to eq customer1.first_name
      end
    end
    context 'given a customer first name' do
      it 'returns a customer with that first name' do
        get "/customers/find?first_name=#{customer2.first_name}"
        expect(output['id']).to eq customer2.id
        expect(output['first_name']).to eq customer2.first_name
      end
    end

    context 'given a customer last name' do
      it 'returns a customer with that last name' do
        get "/customers/find?last_name=#{customer2.last_name}"
        expect(output['id']).to eq customer2.id
        expect(output['first_name']).to eq customer2.first_name
      end
    end
  end

  describe 'customers/find_all' do
    context 'given a customer first name' do
      it 'returns all customers with that first name' do
        customer4
        get "/customers/find_all?first_name=#{customer1.first_name}"
        expect(output.count).to eq 2
      end

      it 'returns all customers with that first name, case insensitive' do
        customer4
        get "/customers/find_all?first_name=jerry"
        expect(output.count).to eq 2
      end
    end

    context 'given a customer last name' do
      it 'returns all customers with that last name' do
        customer4 && customer5
        get "/customers/find_all?last_name=#{customer5.last_name}"
        expect(output.count).to eq 2
      end

      it 'returns all customers with that last name, case insensitive' do
        customer4 && customer5
        get "/customers/find_all?last_name=SPRINGER"
        expect(output.count).to eq 2
      end
    end
  end

  describe 'customers/random' do
    it 'returns a random customer instance' do
      get '/customers/random'
      expect( [ customer1.id, customer2.id ] ).to include( output['id'] )
    end
  end
end
