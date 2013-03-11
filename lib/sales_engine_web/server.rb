module SalesEngineWeb
  class Server < Sinatra::Base
    get '/merchants/find' do
      status 200
      body Merchant.find(params[:id]).to_json
    end
  end
end