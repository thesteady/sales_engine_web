require 'spec_helper'

describe "/invoices/:id" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

#DO I NEED TO TEST EACH OF THESE FOR AN id does not exist?
  describe '/transactions' do
    #context 'given the id exists'
    it 'returns a collection of associated transactions' do
      pending
    end
  end

  describe '/invoice_items' do
    it 'returns a collection of associated invoice items' do
      pending
    end
  end

  describe '/items' do
    it 'returns a collection of associated items' do
      pending
    end
  end

  describe '/customer' do
    it 'returns the associated customer' do
      pending
    end
  end

  describe '/merchant' do
    it 'returns the associate merchant' do
      pending
    end
  end
end
