require 'spec_helper'

describe "/items/" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end
  before(:each) do
    merchant1 && item1
  end
  let(:merchant1) {SalesEngineWeb::Merchant.create(name:'ShoesALot')}
  let(:item1) {SalesEngineWeb::Item.create(name: 'Shoes', merchant_id: merchant1.id, description: 'Blah blah', unit_price: 1999)}

  describe '/items/find' do
    context 'given an id' do
      it "returns the item" do
        get "/items/find?id=#{item1.id}"
        output = JSON.parse(last_response.body)
        expect(output['id']).to eq item1.id
        expect(output['name']).to eq item1.name
      end
    end

    context 'given an item name' do
      it "returns an item instance" do
        get "/items/find?name=#{item1.name}"
        output = JSON.parse(last_response.body)
        expect(output['id']).to eq item1.id
        expect(output['name']).to eq item1.name
      end

      it 'returns an item instance, case insensitive' do
        get "/items/find?name=#{item1.name.upcase}"
        output = JSON.parse(last_response.body)
        expect(output['id']).to eq item1.id
        expect(output['name']).to eq item1.name
      end
    end

    context 'given an item description' do
      it 'returns an item instance' do
        get "/items/find?description=Blah%20Blah"
        output = JSON.parse(last_response.body)
        expect(output['id']).to eq item1.id
        expect(output['name']).to eq item1.name
      end

      it 'returns an item instance, case insensitive' do
        get "/items/find?description=blah%20blah"
        output = JSON.parse(last_response.body)
        expect(output['id']).to eq item1.id
        expect(output['name']).to eq item1.name
      end
    end

    context 'given an item unit price in cents' do
      it 'returns an item instance' do
        pending
      end
    end

    context 'given an item unit price in float (21.99)' do
      it 'returns and item instance' do
        pending
      end
    end

    context 'given a merchant id' do
      it 'returns an item instance' do
        pending
      end
    end
  end

  describe '/items/find_all' do
    context 'given an item name substring' do
      it 'returns all items with that substring' do
        pending
      end

      it 'returns all items with that substring, case insensitive' do
        pending
      end
    end

    context 'given an item description substring' do
      it "returns all items with that substring in their description" do
        pending
      end

      it "returns all items with that substring in their description, case insensitive" do
        pending
      end
    end

    context 'given an item unit price' do
      it "returns all items with that unit price" do
        pending
      end
    end

    context 'given a merchant id' do
      it "returns all items with that merchant id" do
        pending
      end
    end
  end

  describe '/items/random' do
    it "returns a random item" do
      pending
    end
  end
end
