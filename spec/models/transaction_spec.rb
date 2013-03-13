require 'spec_helper'

module SalesEngineWeb
  describe Transaction do
    let(:customer1) {SalesEngineWeb::Customer.create(first_name: 'Clint', last_name: 'Eastwood')}
    let(:merchant1) {SalesEngineWeb::Merchant.create(name: 'Scotts Shirt Shack')}
    let(:invoice1) {SalesEngineWeb::Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id)}
    let(:transact1) {Transaction.create(invoice_id: invoice1.id, credit_card_number: '46594959454',
        credit_card_expiration: '10/13', result: 'shipped')}

    describe '.create' do
      it 'creates a Transaction' do
        transaction = transact1
        expect( transaction.result ).to eq "shipped"
      end
    end

    describe 'find' do
      context 'given an id' do
        it 'returns the transaction instance' do
         transact =  Transaction.find(transact1.id)
         expect(transact.id).to eq transact1.id
        end
      end

      context 'given an invoice id' do
        it 'returns the transaction instance' do
          transact = Transaction.find_by_invoice_id(transact1.invoice_id)
          expect(transact.invoice_id).to eq transact1.invoice_id
        end
      end
    end

    describe 'find_all' do
      context 'given an invoice id' do
        it 'returns multiple instances of transactions' do
          results = Transaction.find_all_by_invoice_id(transact1.invoice_id)
          expect(results.count).to eq 1
        end
      end

      # context 'given a customer id' do
      #   it 'uses invoices to return the transactions by customer id' do
      #     results = Transaction.find_all_by_customer_id(customer1.id)
      #     expect(results.count).to eq 1
      #   end
      # end
    end
  end
end
