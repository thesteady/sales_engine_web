require 'spec_helper'

describe "/transactions/" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end
  before(:each) do
    customer1 && merchant1 && invoice1 && transact1 && transact2
  end

  let(:customer1) {SalesEngineWeb::Customer.create(first_name: 'Clint', last_name: 'Eastwood')}
  let(:merchant1) {SalesEngineWeb::Merchant.create(name: 'Scotts Shirt Shack')}
  let(:invoice1)  {SalesEngineWeb::Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id)}
  let(:transact1) {SalesEngineWeb::Transaction.create(invoice_id: invoice1.id, credit_card_number: '46594959454',
                  credit_card_expiration: '10/13', result: 'shipped')}
  let(:transact2) {SalesEngineWeb::Transaction.create(invoice_id: invoice1.id, credit_card_number: '33333333333',
                  credit_card_expiration: '09/12', result: 'shipped')}

  describe '/find' do
    context 'given a transaction id' do
      it 'returns the associated transaction' do
        get "/transactions/find?id=#{ transact1.id }"
        output = JSON.parse(last_response.body)
        expect( output['id'] ).to eq transact1.id
        expect( output['result'] ).to eq transact1.result
      end
    end

    context 'given an invoice id' do
      it 'returns an associated transaction' do
        get "/transactions/find?invoice_id=#{transact1.invoice_id}"
        output = JSON.parse(last_response.body)
        expect( output['id'] ).to eq transact1.id
        expect( output['result'] ).to eq transact1.result
      end
    end

    # context 'given a credit_card_number' do
    #   it 'returns an associated transaction' do
    #     pending
    #   end
    # end

    # context 'given a credit_card_expiration_date' do
    #   it 'returns an associated transaction' do
    #     pending
    #   end
    # end

    # context 'given a result' do
    #   it 'returns an associated transaction' do
    #     pending
    #   end
    # end
  end

  describe '/find_all' do
    context 'given an invoice id' do
      it 'returns all associated transactions' do

        pending

        get "transactions/find_all?invoice_id=t#{transact1.invoice_id}"
        output = JSON.parse(last_response.body)
        expect(output.count).to eq 2
      end
    end

    # context 'given a credit_card_number' do
    #   it 'returns all associated transactions' do
    #     pending
    #   end
    # end

    # context 'given a credit_card_expiration_date' do
    #   it 'returns all associated transactions' do
    #     pending
    #   end
    # end

    # context 'given a result' do
    #   it 'returns all associated transactions' do
    #     pending
    #   end
    # end
  end

  describe '/transactions/random' do
    it 'returns a random transaction instance' do
      get '/transactions/random'
      output = JSON.parse(last_response.body)
      expect( [ transact1.id, transact2.id ] ).to include( output['id'] )
    end
  end
end
