require 'spec_helper'

describe "/transactions/:id" do
  include Rack::Test::Methods
  include_context 'standard output'

  def app
    SalesEngineWeb::Server
  end

  before(:each) do
    customer1 && merchant1 && invoice1 && transaction1
  end

  let(:customer1) {SalesEngineWeb::Customer.create(first_name: 'Clint', last_name: 'Eastwood')}
  let(:merchant1) {SalesEngineWeb::Merchant.create(name: 'Scotts Shirt Shack')}
  let(:invoice1) {SalesEngineWeb::Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id)}
  let(:transaction1) {SalesEngineWeb::Transaction.create(invoice_id: invoice1.id, credit_card_number: '46594959454',
                  credit_card_expiration: '10/13', result: 'shipped')}
  describe '/invoice' do
    it 'returns the associated invoice' do
      get "/transactions/#{transaction1.id}/invoice"
      expect(output['id']).to eq transaction1.invoice_id
      end
    end

end
