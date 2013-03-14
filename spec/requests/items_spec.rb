require 'spec_helper'

describe "/items/" do
  include Rack::Test::Methods
  include_context 'standard output'

  def app
    SalesEngineWeb::Server
  end
  before(:each) do
    merchant1 && item1
  end
  let(:merchant1) {SalesEngineWeb::Merchant.create(name:'ShoesALot')}
  let(:item1) {SalesEngineWeb::Item.create(name: 'Shoes', merchant_id: merchant1.id, description: 'Blah blah', unit_price: 1999)}
  let(:item2) {SalesEngineWeb::Item.create(name: 'PairofShoes', merchant_id: merchant1.id, description: 'more', unit_price: 1999)}

  describe '/items/find' do
    context 'given an id' do
      it "returns the item" do
        get "/items/find?id=#{item1.id}"
        expect(output['id']).to eq item1.id
        expect(output['name']).to eq item1.name
      end
    end

    context 'given an item name' do
      it "returns an item instance" do
        get "/items/find?name=#{item1.name}"
        expect(output['id']).to eq item1.id
        expect(output['name']).to eq item1.name
      end

      it 'returns an item instance, case insensitive' do
        get "/items/find?name=#{item1.name.upcase}"
        expect(output['id']).to eq item1.id
        expect(output['name']).to eq item1.name
      end
    end

    context 'given an item description' do
      it 'returns an item instance' do
        get "/items/find?description=Blah%20Blah"
        expect(output['id']).to eq item1.id
        expect(output['name']).to eq item1.name
      end

      it 'returns an item instance, case insensitive' do
        get "/items/find?description=blah%20blah"
        expect(output['id']).to eq item1.id
        expect(output['name']).to eq item1.name
      end
    end

    context 'given a merchant id' do
      it 'returns an item instance' do
        get "/items/find?merchant_id=#{merchant1.id}"
        expect(output['id']).to eq item1.id
        expect(output['name']).to eq item1.name
      end
    end
  end

  describe '/items/find_all' do
    context 'given an item name substring' do
      it 'returns all items with that substring' do
        item2
        get "/items/find_all?name=Shoes"
        expect(output.count).to eq 2
      end

      it 'returns all items with that substring, case insensitive' do
        item2
        get "/items/find_all?name=SHOES"
        expect(output.count).to eq 2
      end
    end

    context 'given an item description substring' do
      it "returns all items with that substring in their description" do
        get "/items/find_all?description=Blah%20Blah"
        expect(output.count).to eq 1
      end

      it "returns all items with that substring in their description, case insensitive" do
        get "/items/find_all?description=BLAH%20BLAH"
        expect(output.count).to eq 1
      end
    end
  end

  describe '/items/random' do
    it "returns a random item" do
      item2
      get '/items/random'
      expect( [ item1.id, item2.id ] ).to include( output['id'] )
    end
  end
end
