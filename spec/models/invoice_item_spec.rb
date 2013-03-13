require 'spec_helper'

module SalesEngineWeb
  describe InvoiceItem do
  # before(:each) do
  #   customer1 && merchnat1 && item1 && invoice1
  # end
  #   let(:customer1) {SalesEngineWeb::Customer.create(first_name: 'Clint', last_name: 'Eastwood')}
  #   let(:merchant1) {SalesEngineWeb::Merchant.create(name: 'Scotts Shirt Shack')}
  #   let(:item1) {SalesEngineWeb::Item.create(name: 'Hats', merchant_id: merchant1.id, description: 'Hatty Hat', unit_price: 599)}
  #   let(:invoice1) {SalesEngineWeb::Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id)}
  #   let(:inv_item1) {SalesEngineWeb::InvoiceItem.create(item_id: item1.id, invoice_id: invoice1.id, quantity: 5, unit_price: 399)}

    describe 'create' do
      pending
      # inv_item1
      # expect(inv_item1.quantity).to eq 5
    end

    describe 'find' do
      context 'given an id' do
        it 'returns an instance' do
          pending
        end
      end

      context 'given an item id' do
        it 'returns an instance' do
          pending
        end
      end
    end
  end
end
