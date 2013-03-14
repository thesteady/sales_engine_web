require 'spec_helper'

describe "/invoice_items/:id" do
  include Rack::Test::Methods
  include_context 'standard output'

  def app
    SalesEngineWeb::Server
  end

  before(:each) do
    merchant1 && customer1 && item1 && invoice1 && inv_item1
  end

  let(:merchant1) {SalesEngineWeb::Merchant.create(name: 'Scotts Shirt Shack')}
  let(:item1) {SalesEngineWeb::Item.create(name: 'Hats', merchant_id: merchant1.id, description: 'Hatty Hat', unit_price: 599)}
  let(:customer1) {SalesEngineWeb::Customer.create(:first_name => 'Jerry', :last_name => 'Seinfeld')}
  let(:invoice1) {SalesEngineWeb::Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id)}
  let(:inv_item1) {SalesEngineWeb::InvoiceItem.create(item_id: item1.id, invoice_id: invoice1.id, quantity: 5, unit_price: 399)}

  describe '/invoice' do
    it 'returns the associated invoice' do

      get "/invoice_items/#{inv_item1.id}/invoice"
      expect(output['id']).to eq inv_item1.invoice_id
    end
  end

  describe '/item' do
    it 'returns the associated item' do
      get "/invoice_items/#{inv_item1.id}/item"
      expect(output['id']).to eq inv_item1.item_id
    end
  end
end
