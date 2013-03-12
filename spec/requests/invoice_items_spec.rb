require 'spec_helper'

describe "/invoice_items/" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

  describe '/invoice_items/find' do
    context 'given an id' do
      it 'returns the invoice item with that id' do
        pending
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
