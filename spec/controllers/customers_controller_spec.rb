require 'spec_helper'

module SalesEngineWeb
  describe CustomersController do
    describe '.find' do
      it 'returns a response' do
        params = {id: 0}
      expect(CustomersController.find(params)).to be_kind_of Response
      end
    end

    # describe '.find_all' do
    #   it 'returns a response' do
    #     params = {customer_id: 1}
    #     expect(CustomersController.find_all(params)).to be_kind_of Response
    #   end
    # end

    describe '.random' do
      it 'returns a response' do
        expect(CustomersController.random).to be_kind_of Response
      end
    end

  end
end
