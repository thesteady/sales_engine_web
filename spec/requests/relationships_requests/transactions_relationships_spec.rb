require 'spec_helper'

describe "/transactions/:id" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

  describe '/invoice' do
    it 'returns the associated invoice' do
      pending
      get "/transactions/#{transaction1.id}/invoice"
      output = JSON.parse(last_response.body)
      expect(output.count).to eq 1
      end
    end

end
