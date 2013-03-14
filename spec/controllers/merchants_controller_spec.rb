require 'spec_helper'

module SalesEngineWeb
  describe MerchantsController do
    describe '.find' do
      it 'returns a response' do
        params = {id: 0}
      expect(MerchantsController.find(params)).to be_kind_of Response
      end
    end

    describe '.find_all' do
      it 'returns a response' do
        params = {name: 'Coffee'}
        expect(MerchantsController.find_all(params[:name])).to be_kind_of Response
      end
    end

    describe '.find_items' do
      it 'returns a collection of items associated with the merchant' do
        merchant = Merchant.create(name: 'whaaaat')
        params = {id: merchant.id}
        expect(MerchantsController.find_items(params[:id])).to be_kind_of Response
      end
    end

    describe '.find_invoices' do
      it 'returns a collection of invoices associated with the merchant' do
        merchant = Merchant.create(name: 'whaaaat')
        params = {id: merchant.id}
        expect(MerchantsController.find_invoices(params[:id])).to be_kind_of Response
      end
    end

  end
end
