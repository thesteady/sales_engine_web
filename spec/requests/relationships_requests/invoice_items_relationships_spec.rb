require 'spec_helper'

describe "/invoice_items/:id" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

  describe '/invoice' do
    pending


    it 'returns the associated invoice' do
    end
  end

  describe '/item' do
    it 'returns the associated item' do
      pending
    end
  end
end
