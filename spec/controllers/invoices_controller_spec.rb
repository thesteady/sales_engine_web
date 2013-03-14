require 'spec_helper'

module SalesEngineWeb
  describe InvoicesController do
    describe '.find' do
      it 'returns a response' do
        params = {id: 0}
      expect(InvoicesController.find(params)).to be_kind_of Response
      end
    end

    describe '.find_all' do
      it 'returns a response' do
        params = {customer_id: 1}
        expect(InvoicesController.find_all(params)).to be_kind_of Response
      end
    end

    describe '.random' do
      it 'returns a response' do
        expect(InvoicesController.random).to be_kind_of Response
      end
    end

  end
end
