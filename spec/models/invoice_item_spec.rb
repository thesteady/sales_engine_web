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
  let(:inv_item1) {SalesEngineWeb::InvoiceItem.create(item_id: item1.id, invoice_id: invoice1.id, quantity: 5, unit_price: 399)}
  let(:inv_item2) {SalesEngineWeb::InvoiceItem.create(item_id: item1.id, invoice_id: invoice1.id, quantity: 90, unit_price: 199)}

    describe '.create' do
      it 'creates a invoice item' do
        inv_item = InvoiceItem.create(item_id: item1.id, invoice_id: invoice1.id, quantity: 2, unit_price: 400)
        expect( inv_item.quantity).to eq 2
      end
    end

    describe 'random' do
      it 'returns a random invoice item' do
        inv_item1 && inv_item2
        result = InvoiceItem.random
      expect(result).to be_kind_of InvoiceItem
      end
    end

    describe 'find' do
      context 'given an id' do
        it 'finds the invoice item' do
          inv_item1
          result = InvoiceItem.find(inv_item1.id)
          expect(result.id).to eq inv_item1.id
        end
      end

      context 'given an item id' do
        it 'finds the inv item' do
          inv_item1
          result = InvoiceItem.find_by_item_id(inv_item1.item_id)
          expect(result.item_id).to eq inv_item1.item_id
        end
      end

      context 'given an invoice id' do
        it 'finds the inv item' do
          inv_item1
          result = InvoiceItem.find_by_invoice_id(inv_item1.invoice_id)
          expect(result.invoice_id).to eq inv_item1.invoice_id
        end
      end
    end

    describe 'find_all' do
      context 'given an item id' do
        it 'returns a collection of invoice items by item id' do
          results = InvoiceItem.find_all_by_item_id(inv_item1.item_id)
          expect(results.count).to eq 1
        end
      end

      context 'given an invoice id' do
        it 'returns a collection of invoice items by invoice id' do
          results = InvoiceItem.find_all_by_invoice_id(inv_item1.invoice_id)
          expect(results.count).to eq 1
        end
      end
    end

  end
end
