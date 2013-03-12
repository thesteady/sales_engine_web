require 'spec_helper'

describe "/merchants/:id" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

  describe '/merchants/:id/items' do
    context 'when that id exists' do
      it 'returns a collection of items associated with the merchant' do
        pending
      end
    end

    context 'when that id does not exist' do
      it 'displays an error message' do
        pending
      end
    end
  end

  describe '/merchants/:id/invoices' do
    context 'when that id exists' do
      it 'returns a collection of invoices associated with the merchant' do
        pending
      end
    end

    context 'when that id does not exist' do
      it 'displays an error message' do
        pending
      end
    end
  end
end
