require 'spec_helper'

describe "/customers/:id" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

  before(:each) do
    customer1 && merchant1
  end

  let(:customer1) {SalesEngineWeb::Customer.create(:first_name => 'Jerry', :last_name => 'Seinfeld')}
  let(:merchant1){ SalesEngineWeb::Merchant.create(:name => "Jumpstart Lab") }
  let(:invoice1) {SalesEngineWeb::Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id)}
  let(:invoice2) {SalesEngineWeb::Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id)}
  let(:transaction1) {SalesEngineWeb::Transaction.create(invoice_id: invoice1.id, credit_card_number: '46594959454',
                  credit_card_expiration: '10/13', result: 'shipped')}
  let(:transaction2) {SalesEngineWeb::Transaction.create(invoice_id: invoice2.id, credit_card_number: '6666675757474574',
                  credit_card_expiration: '10/13', result: 'shipped')}
  describe '/invoices' do
    it 'returns a collection of invoices associated with the customer' do
      invoice1 && invoice2
      get "/customers/#{customer1.id}/invoices"
      output = JSON.parse(last_response.body)
      expect(output.count).to eq 2
    end
  end

  describe '/transactions' do
    it 'returns a collection of transactions associated with the customer' do
      transaction1 && transaction2
      get "/customers/#{customer1.id}/transactions"
      output = JSON.parse(last_response.body)
      expect(output.count).to eq 2
    end
  end
end
