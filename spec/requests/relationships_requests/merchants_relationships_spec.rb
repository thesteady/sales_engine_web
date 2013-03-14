require 'spec_helper'

describe "/merchants/:id" do
  include Rack::Test::Methods
  include_context 'standard output'

  def app
    SalesEngineWeb::Server
  end

  before(:each) do
    merchant1 && item1 && item2
  end

  let(:merchant1){ SalesEngineWeb::Merchant.create(:name => "Jumpstart Lab") }
  let(:item1) {SalesEngineWeb::Item.create(name: 'Shoes', merchant_id: merchant1.id, description: 'Blah blah', unit_price: 1999)}
  let(:item2) {SalesEngineWeb::Item.create(name: 'PairofShoes', merchant_id: merchant1.id, description: 'more', unit_price: 1999)}
  let(:customer1) {SalesEngineWeb::Customer.create(:first_name => 'Jerry', :last_name => 'Seinfeld')}
  let(:invoice1) {SalesEngineWeb::Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id)}
  let(:invoice2) {SalesEngineWeb::Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id)}
  let(:invoice3) {SalesEngineWeb::Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id)}
  let(:invoice4) {SalesEngineWeb::Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id)}

  describe '/merchants/:id/items' do
    context 'when that id exists' do
      it 'returns a collection of items associated with the merchant' do
        get "/merchants/#{merchant1.id}/items"
        expect(output.count).to eq 2
      end
    end
  end

  describe '/merchants/:id/invoices' do
    context 'when that id exists' do
      it 'returns a collection of invoices associated with the merchant' do
        customer1 && invoice1 && invoice2 && invoice3 && invoice4
        get "/merchants/#{merchant1.id}/invoices"
        expect(output.count).to eq 4
      end
    end
  end
end
