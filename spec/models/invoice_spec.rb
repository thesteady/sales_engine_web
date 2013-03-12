require 'spec_helper'

module SalesEngineWeb
  describe Invoice do

    describe 'create' do
      it 'creates an invoice' do
        invoice = Invoice.create({:customer_id => 3, :merchant_id => 12})
        expect(invoice.customer_id).to eq 3
        expect(invoice.merchant_id).to eq 12
      end
    end

    describe '.random' do
      it 'returns a random invoice' do
        Invoice.create({:customer_id => 3, :merchant_id => 12})
        Invoice.create({:customer_id => 5, :merchant_id => 512})
        invoice = Invoice.random
        expect(invoice).to be_kind_of Invoice
      end
    end

    describe 'find' do
      context 'given an id' do
        it 'returns the associated invoice' do

          target = Invoice.create({:customer_id => 3, :merchant_id => 12})
          found = Invoice.find(target.id)
          expect(found.id).to eq target.id
          expect(found.customer_id).to eq target.customer_id
        end
      end
    end

    describe 'find_by_customer_id' do
      context 'given a customer id' do
        it 'returns the associated invoice' do
          target = Invoice.create({:customer_id => 3, :merchant_id => 12})
          found = Invoice.find_by_customer_id(target.customer_id)
          expect(found.id).to eq target.id
          expect(found.customer_id).to eq target.customer_id
        end
      end
    end

    describe 'find_by_merchant_id' do
      it 'returns the associated invoice' do
        target = Invoice.create({:customer_id => 3, :merchant_id => 12})
        found = Invoice.find_by_merchant_id(target.merchant_id)
        expect(found.id).to eq target.id
        expect(found.customer_id).to eq target.customer_id
        expect(found.merchant_id).to eq target.merchant_id
      end
    end

    # describe 'find_all_by_customer_id' do
    #   it 'returns the associated invoice' do
    #     target = Invoice.create({:customer_id => 3, :merchant_id => 12})
    #     found = Invoice.find_all_by_customer_id(target.merchant_id)
    #     expect(found.id).to eq target.id
    #     expect(found.customer_id).to eq target.customer_id
    #     expect(found.merchant_id).to eq target.merchant_id
    #   end
    # end

    describe 'find_all_by_merchant_id' do
      it 'returns a collection of invoices' do
        Invoice.create(:customer_id => 2, :merchant_id => 2)
        Invoice.create(:customer_id => 5, :merchant_id => 2)
        results = Invoice.find_all_by_merchant_id(2)
        expect(results.count).to eq 2
      end
    end
  end
end
