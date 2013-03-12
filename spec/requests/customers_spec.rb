require 'spec_helper'

describe "/customers/" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

  describe '/customers/find' do
    context 'given a customer id' do
      it 'returns the customer instance with that id' do
        pending
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
