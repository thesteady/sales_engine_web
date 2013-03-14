require 'spec_helper'

describe "/invoices/:id" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end
  before(:each) do
    customer1 && merchant1 && invoice1 &&transact1 &&transact2
  end

  let(:customer1) {SalesEngineWeb::Customer.create(first_name: 'Clint', last_name: 'Eastwood')}
  let(:merchant1) {SalesEngineWeb::Merchant.create(name: 'Hats N More')}
  let(:invoice1) {SalesEngineWeb::Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id)}
  let(:transact1) {SalesEngineWeb::Transaction.create(invoice_id: invoice1.id, credit_card_number: '46594959454',
                  credit_card_expiration: '10/13', result: 'shipped')}
  let(:transact2) {SalesEngineWeb::Transaction.create(invoice_id: invoice1.id, credit_card_number: '46594959454',
                  credit_card_expiration: '10/13', result: 'shipped')}
  let(:item1) {SalesEngineWeb::Item.create(name: 'Shoes', merchant_id: merchant1.id, description: 'Blah blah', unit_price: 1999)}
  let(:inv_item1) {SalesEngineWeb::InvoiceItem.create(item_id: item1.id, invoice_id: invoice1.id, quantity: 5, unit_price: 399)}
  let(:inv_item2) {SalesEngineWeb::InvoiceItem.create(item_id: item1.id, invoice_id: invoice1.id, quantity: 90, unit_price: 199)}

  describe '/transactions' do
    it 'returns a collection of associated transactions' do
      get "/invoices/#{invoice1.id}/transactions"
      output = JSON.parse(last_response.body)
      expect(output.count).to eq 2
    end
  end

  describe '/invoice_items' do
    it 'returns a collection of associated invoice items' do
      item1 && inv_item1 && inv_item2
      get "/invoices/#{invoice1.id}/invoice_items"
      output = JSON.parse(last_response.body)
      expect(output.count).to eq 2
    end
  end

  describe '/items' do
    it 'returns a collection of associated items' do
      inv_item1
      get "/invoices/#{invoice1.id}/items"
      output = JSON.parse(last_response.body)
      expect(output.count).to eq 1
    end
  end

  describe '/customer' do
    it 'returns the associated customer' do
      get "/invoices/#{invoice1.id}/customer"
      output = JSON.parse(last_response.body)
      expect(output['id']).to eq invoice1.customer_id
    end
  end

  describe '/merchant' do
    it 'returns the associate merchant' do
      get "/invoices/#{invoice1.id}/merchant"
      output = JSON.parse(last_response.body)
      expect(output['id']).to eq invoice1.merchant_id
    end
  end
end
