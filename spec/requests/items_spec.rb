require 'spec_helper'

describe "/items/" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

  describe '/items/find' do
    context 'given an id' do
      it "returns an item" do
        pending
      end
    end

    context 'given an item name' do
      it "returns an item instance" do
        pending
      end

      it 'returns an item instance, case insensitive' do
        pending
      end
    end

    context 'given an item description' do
      it 'returns an item instance' do
        pending
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
