require 'spec_helper'

describe "/invoices/" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

  # id,customer_id,merchant_id,status,created_at,updated_at

  before (:each) do
  customer1 && customer2 && merchant1 && invoice1 && invoice2
  end
  let(:customer1) {SalesEngineWeb::Customer.create(first_name: 'Clint', last_name: 'Eastwood')}
  let(:customer2) {SalesEngineWeb::Customer.create(first_name: 'Whoopi', last_name: 'Goldberg')}
  let(:merchant1) {SalesEngineWeb::Merchant.create(name: 'Hats N More')}
  let(:merchant2) {SalesEngineWeb::Merchant.create(name: 'Puppyville')}
  let(:invoice1) {SalesEngineWeb::Invoice.create(customer_id: customer1.id, merchant_id: merchant2.id)}
  let(:invoice2) {SalesEngineWeb::Invoice.create(customer_id: customer2.id, merchant_id: merchant2.id)}
  let(:invoice3) {SalesEngineWeb::Invoice.create(customer_id: customer2.id, merchant_id: merchant1.id)}
  let(:invoice4) {SalesEngineWeb::Invoice.create(customer_id: customer1.id, merchant_id: merchant1.id)}

  describe 'find' do
    context "given an id" do
      it "returns the invoice associated with the id" do
        get "/invoices/find?id=#{invoice1.id}"
        output = JSON.parse(last_response.body)
        expect( output['id'] ).to eq invoice1.id
        expect( output['customer_id'] ).to eq invoice1.customer_id
        expect( [ invoice1.id, invoice2.id ] ).to include( output['id'] )
      end
    end

    context "given a customer id" do
      it "returns an invoice associated with the customer id" do
        get "/invoices/find?customer_id=#{invoice1.customer_id}"
        output = JSON.parse(last_response.body)
        expect( output['id'] ).to eq invoice1.id
        expect( output['customer_id'] ).to eq invoice1.customer_id
      end
    end

    context "given a merchant_id" do
      it "returns an invoice associated with the merchant id" do
        get "/invoices/find?merchant_id=#{invoice1.merchant_id}"
        output = JSON.parse(last_response.body)
        expect( output['id']).to eq invoice1.id
        expect( output['merchant_id']).to eq invoice1.merchant_id
      end
    end
  end

  describe '/invoices/find_all' do
    context 'given a customer id' do
      it "returns all the invoices associated with the customer id" do
        invoice3 && invoice4
        get "/invoices/find_all?customer_id=#{invoice1.customer_id}"
        output = JSON.parse(last_response.body)
        expect(output.count).to eq 2
      end
    end

    context 'given a merchant id' do
      it "returns all the invoices associated with the merchant id" do
        invoice3 && invoice4
        get "/invoices/find_all?merchant_id=#{invoice3.merchant_id}"
        output = JSON.parse(last_response.body)
        expect(output.count).to eq 2
      end
    end
  end

  describe 'invoices/random' do
    it "returns a random invoice" do
      get "/invoices/random"
      output = JSON.parse(last_response.body)
      expect( [ invoice1.id, invoice2.id ] ).to include( output['id'] )
    end
  end
end
