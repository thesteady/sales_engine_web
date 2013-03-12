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
  end
end
