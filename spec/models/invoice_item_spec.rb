require 'spec_helper'

module SalesEngineWeb
  describe InvoiceItem do
  before(:each) do
    merchant1 && customer1 && item1 && invoice1
  end

  let(:customer1) {SalesEngineWeb::Customer.create(first_name: 'Clint', last_name: 'Eastwood')}
  let(:merchant1) {SalesEngineWeb::Merchant.create(name:'ShoesALot')}
  let(:invoice1) {SalesEngineWeb::Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id)}
  let(:item1) {SalesEngineWeb::Item.create(name: 'Shoes', merchant_id: merchant1.id, description: 'Blah blah', unit_price: 1999)}

    describe '.create' do
      it 'creates a invoice item' do
        inv_item = InvoiceItem.create(item_id: item1.id, invoice_id: invoice1.id, quantity: 2, unit_price: 400)
        expect( inv_item.quantity).to eq 2
      end
    end

    describe 'find' do
      context 'given an id' do
        it 'finds the invoice item' do
        end
      end
    end

    describe 'find_all' do
      context 'given an item id' do
        it 'returns a collection of invoice items by item id' do
          pending
        end
      end

      context 'given an invoice id' do
        it 'returns a collection of invoice items by item id' do
          pending
        end
      end
    end

  end
end
