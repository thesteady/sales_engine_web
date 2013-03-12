require 'spec_helper'

describe "/items/:id" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

  describe 'invoice_items' do
    it 'returns a collection of associated invoice items' do
      pending
    end
  end

  describe 'merchant' do
    it 'returns the associate merchant' do
      pending
    end
  end
end
