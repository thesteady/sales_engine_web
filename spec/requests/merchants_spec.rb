Bundler.require
require './lib/sales_engine_web/server'

describe "/merchants/" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

  describe "find" do
    context "given id=12" do
      it "goes" do
        get '/merchants/find?id=12'
        expect( last_response ).to be_ok
      end
    end
  end
end