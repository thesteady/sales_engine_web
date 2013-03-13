require 'spec_helper'

describe "/invoice_items/" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

  # let(:inv_item1) {SalesEngineWeb::InvoiceItem.create(item_id: item1.id, invoice_id: invoice1.id, quantity: 5, unit_price: 399)}

  describe '/invoice_items/find' do
    context 'given an id' do
      it 'returns the invoice item with that id' do
        pending
       # get "invoice_items/find?id=#{inv_item1.id}"
       # output = JSON.parse(last_response.body)
       # expect(output['id']).to eq inv_item1.id
      end
    end

    context 'given an item id' do
      it 'returns an invoice item with that item id' do
        pending
      end
    end

    context 'given an invoice id' do
      it 'returns an invoice item with that invoice id' do
        pending
      end
    end

    context 'given a quantity' do
      it 'returns an invoice item with that quantity' do
        pending
      end
    end

    context 'given a unit price' do
      it 'returns an invoice item with that unit price' do
        pending
      end
    end
  end

  describe '/invoice_items/find_all' do
    context 'given an item id' do
      it 'returns all invoice items with that item id' do
        pending
      end
    end

    context 'given an invoice id' do
      it 'returns all invoice items with that invoice id' do
        pending
      end
    end

    context 'given a quantity' do
      it 'returns all invoice items with that quantity' do
        pending
      end

    end

    context 'given a unit price' do
      it 'returns all invoice items with that unit price' do
        pending
      end
    end
  end

  describe '/invoice_items/random' do
    it 'returns a random invoice item instance' do
      pending
    end
  end
end
