require 'spec_helper'

describe "/transactions/:id" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

  describe '/invoice' do
    it 'returns the associated invoice' do
      pending
    end
  end
end
