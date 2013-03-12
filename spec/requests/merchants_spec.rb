require 'spec_helper'

describe "/merchants/" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

  before(:each) do
    merchant1 && merchant2
  end

  let(:merchant1){ SalesEngineWeb::Merchant.create(:name => "Jumpstart Lab") }
  let(:merchant2){ SalesEngineWeb::Merchant.create(:name => "gSchool") }
  let(:merchant3){ SalesEngineWeb::Merchant.create(:name => "My Shop Things") }
  let(:merchant3){ SalesEngineWeb::Merchant.create(:name => "Lucy's My Shop") }

  describe "random" do
    it "returns a random merchant" do
      get '/merchants/random'
      output = JSON.parse(last_response.body)
      expect( [ merchant1.id, merchant2.id ] ).to include( output['id'] )
    end
  end

  describe "find" do
    context "given an existing id" do
      it "finds the merchant" do
        get "/merchants/find?id=#{ merchant1.id }"
        output = JSON.parse(last_response.body)
        expect( output['id'] ).to eq merchant1.id
        expect( output['name'] ).to eq merchant1.name
      end

      it "finds merchant2" do
        get "/merchants/find?id=#{merchant2.id}"
        output = JSON.parse(last_response.body)
        expect( output['id'] ).to eq merchant2.id
        expect( output['name'] ).to eq merchant2.name
      end
    end

    context "given name='Jumpstart%20Lab'" do
      it "finds the merchant" do
        get "/merchants/find?name=Jumpstart%20Lab"
        output = JSON.parse(last_response.body)
        #expect( output['id'] ).to eq merchant1.id
        expect( output['name'] ).to eq merchant1.name
      end
    end
  end

  describe "find_all" do
    context "given name='My%20Shop'" do
      it "returns all merchants who have 'My Shop' in their name" do
        pending
        get "/merchants/find_all?name=My%20Shop"
        output = JSON.parse(last_response.body)
        expect(output.count).to eq 2
      end
    end
  end
end
