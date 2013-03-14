require 'spec_helper'

module SalesEngineWeb
  describe Invoice do
    let(:customer1) {SalesEngineWeb::Customer.create(first_name: 'Jerry', last_name: 'Seinfeld')}
    let(:customer2) {SalesEngineWeb::Customer.create(first_name: 'Clint', last_name: 'Eastwood')}
    let(:merchant1) {SalesEngineWeb::Merchant.create(name: 'Scotts Shirt Shack')}
    let(:invoice1) {Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id)}

  before(:each) do
    customer1 && merchant1
  end

    describe 'create' do
      it 'creates an invoice' do
        invoice = Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id)
        expect(invoice.customer_id).to eq customer1.id
        expect(invoice.merchant_id).to eq merchant1.id
      end
    end

    describe '.random' do
      it 'returns a random invoice' do
        invoice1
        Invoice.create({customer_id: customer2.id, merchant_id: merchant1.id})
        invoice = Invoice.random
        expect(invoice).to be_kind_of Invoice
      end
    end

    describe 'find' do
      context 'given an id' do
        it 'returns the associated invoice' do

          target = invoice1
          found = Invoice.find(target.id)
          expect(found.id).to eq target.id
          expect(found.customer_id).to eq target.customer_id
        end
      end
    end

    describe 'find_by_customer_id' do
      context 'given a customer id' do
        it 'returns the associated invoice' do
          target = invoice1
          found = Invoice.find_by_customer_id(target.customer_id)
          expect(found.id).to eq target.id
          expect(found.customer_id).to eq target.customer_id
        end
      end
    end

    describe 'find_by_merchant_id' do
      it 'returns the associated invoice' do
        target = invoice1
        found = Invoice.find_by_merchant_id(target.merchant_id)
        expect(found.id).to eq target.id
        expect(found.customer_id).to eq target.customer_id
        expect(found.merchant_id).to eq target.merchant_id
      end
    end

    describe 'find_all_by_customer_id' do
      it 'returns all the associated invoices' do
        target = invoice1
        found = Invoice.find_all_by_customer_id(target.merchant_id).flatten
        expect(found.count).to eq 1
      end
    end

    describe 'find_all_by_merchant_id' do
      it 'returns a collection of invoices' do
        invoice1
        Invoice.create(:customer_id => customer2.id, :merchant_id => merchant1.id)
        results = Invoice.find_all_by_merchant_id(merchant1.id)
        expect(results.count).to eq 2
      end
    end
  end
end
