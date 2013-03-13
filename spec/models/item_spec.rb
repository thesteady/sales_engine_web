require 'spec_helper'

module SalesEngineWeb
  describe Item do
    before(:each) do
      merchant1 && item1
    end

    let(:merchant1) {SalesEngineWeb::Merchant.create(name: 'Scotts Shirt Shack')}
    let(:item1) {Item.create(name: 'Hats', merchant_id: merchant1.id, description: 'Hatty Hat', unit_price: 599)}

    describe 'create' do
      it 'creates an item' do
        item = Item.create(name: 'Shoes', merchant_id: merchant1.id, description: 'Blah blah', unit_price: 1999)
        expect(item.name). to eq 'Shoes'
      end
    end

    describe 'find' do
      context 'given an id' do
        it 'finds an item by item id' do
          item = Item.find(item1.id)
          expect(item.name).to eq item1.name
        end
      end

      context 'given a name' do
        it 'finds item by name' do
          item = Item.find_by_name(item1.name)
          expect(item.name).to eq item1.name
        end

        it 'finds item by name, case insensitive' do
          item = Item.find_by_name(item1.name.downcase)
          expect(item.name).to eq item1.name
        end
      end

      context 'given a description' do
        it 'finds an item by description' do
          item = Item.find_by_description(item1.description)
          expect(item.description).to eq item1.description
        end
        it 'finds an item by description, case insensitive' do
          item = Item.find_by_description(item1.description.upcase)
          expect(item.description).to eq item1.description
        end
      end

    end
  end
end
