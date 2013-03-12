require 'spec_helper'

describe "/customers/" do
  include Rack::Test::Methods

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

  describe '/customers/find' do
    context 'given a customer id' do
      it 'returns the customer instance with that id' do
        get "/customers/find?id=#{customer1.id}"
        output = JSON.parse(last_response.body)
        expect(output['id']).to eq customer1.id
        expect(output['first_name']).to eq customer1.first_name
      end
    end
    context 'given a customer first name' do
      it 'returns a customer with that first name' do
        pending
      end

      it 'returns a customer with that first name, case insensitive' do
        pending
      end
    end
    context 'given a customer last name' do
      it 'returns a customer with that last name' do
        pending
      end

      it 'returns a customer with that last name, case insensitive' do
        pending
      end
    end
  end

  describe 'customers/find_all' do
    context 'given a customer first name' do
      it 'returns all customers with that first name' do
        pending
      end

      it 'returns all customers with that first name, case insensitive' do
        pending
      end
    end
    context 'given a customer last name' do
      it 'returns all customers with that last name' do
        pending
      end

      it 'returns all customers with that last name, case insensitive' do
        pending
      end
    end
  end

  describe 'customers/random' do
    it 'returns a random customer instance' do
      pending
    end
  end
end
