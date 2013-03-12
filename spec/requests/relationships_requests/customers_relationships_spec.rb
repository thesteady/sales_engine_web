require 'spec_helper'

describe "/customers/:id" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

  describe '/invoices' do
    it 'returns a collection of invoices associated with the customer' do
      pending
    end
  end

  describe '/transactions' do
    it 'returns a collection of transactions associated with the customer' do
      pending
    end
  end
end
