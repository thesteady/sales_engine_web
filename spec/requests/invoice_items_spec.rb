require 'spec_helper'

describe "/invoice_items/" do
  include Rack::Test::Methods
  include_context 'standard output'

  def app
    SalesEngineWeb::Server
  end

  before(:each) do
    customer1 && customer2 && merchant1 && invoice1 && invoice2 && item1 && inv_item1 && inv_item2
  end
  let(:customer1) {SalesEngineWeb::Customer.create(first_name: 'Clint', last_name: 'Eastwood')}
  let(:customer2) {SalesEngineWeb::Customer.create(first_name: 'Whoopi', last_name: 'Goldberg')}
  let(:merchant1) {SalesEngineWeb::Merchant.create(name: 'Hats N More')}
  let(:invoice1) {SalesEngineWeb::Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id)}
  let(:invoice2) {SalesEngineWeb::Invoice.create(customer_id: customer2.id, merchant_id: merchant1.id)}
  let(:item1) {SalesEngineWeb::Item.create(name: 'Shoes', merchant_id: merchant1.id, description: 'Blah blah', unit_price: 1999)}

  let(:inv_item1) {SalesEngineWeb::InvoiceItem.create(item_id: item1.id, invoice_id: invoice1.id, quantity: 5, unit_price: 399)}
  let(:inv_item2) {SalesEngineWeb::InvoiceItem.create(item_id: item1.id, invoice_id: invoice1.id, quantity: 90, unit_price: 199)}

  describe '/invoice_items/find' do
    context 'given an id' do
      it 'returns the invoice item with that id' do
       get "invoice_items/find?id=#{inv_item1.id}"
       expect(output['id']).to eq inv_item1.id
      end
    end

    context 'given an item id' do
      it 'returns an invoice item with that item id' do
        get "/invoice_items/find?item_id=#{inv_item1.item_id}"
        expect(output['item_id']).to eq inv_item1.item_id
      end
    end

    context 'given an invoice id' do
      it 'returns an invoice item with that invoice id' do
        get "/invoice_items/find?invoice_id=#{inv_item1.invoice_id}"
        expect(output['invoice_id']).to eq inv_item1.invoice_id
      end
    end
  end

  describe '/invoice_items/find_all' do
    context 'given an item id' do
      it 'returns all invoice items with that item id' do
        get "/invoice_items/find_all?item_id=#{inv_item1.item_id}"
        expect(output.count).to eq 2
      end
    end

    context 'given an invoice id' do
      it 'returns all invoice items with that invoice id' do
        get "/invoice_items/find_all?invoice_id=#{inv_item1.invoice_id}"
        expect(output.count).to eq 2
      end
    end
  end

  describe '/invoice_items/random' do
    it 'returns a random invoice item instance' do
      get '/invoice_items/random'
      expect( [ inv_item1.id, inv_item2.id ] ).to include( output['id'] )
    end
  end
end
