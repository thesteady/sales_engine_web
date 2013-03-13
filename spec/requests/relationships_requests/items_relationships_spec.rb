require 'spec_helper'

describe "/items/:id" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

  before(:each) do
    merchant1 && item1 && customer1 && invoice1 
    # && inv_item1 && inv_item2
  end

  let(:merchant1) {SalesEngineWeb::Merchant.create(name: 'Scotts Shirt Shack')}
  let(:item1) {SalesEngineWeb::Item.create(name: 'Hats', merchant_id: merchant1.id, description: 'Hatty Hat', unit_price: 599)}
  let(:customer1) {SalesEngineWeb::Customer.create(:first_name => 'Jerry', :last_name => 'Seinfeld')}
  let(:invoice1)  {SalesEngineWeb::Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id)}
  # let(:inv_item1) {SalesEngineWeb::InvoiceItem.create(item_id: item1.id, invoice_id: invoice1.id, quantity: 4, unit_price:699)}
  # let(:inv_item2) {SalesEngineWeb::InvoiceItem.create(item_id: item1.id, invoice_id: invoice1.id, quantity: 99, unit_price:199)}

  describe '/invoice_items' do
    it 'returns a collection of associated invoice items' do
      pending
     get "/items/#{item1.id}/invoice_items"
      output = JSON.parse(last_response.body)
      expect(output.count).to eq 2
    end
  end

  describe 'merchant' do
    it 'returns the associated merchant' do
      get "/items/#{item1.id}/merchant"
      output = JSON.parse(last_response.body)
      expect(output['id']).to eq item1.merchant_id
    end
  end

end
