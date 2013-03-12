require 'spec_helper'

describe "/invoices/" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

  # id,customer_id,merchant_id,status,created_at,updated_at

  before (:each) do
  invoice1 && invoice2
  end

  let(:invoice1) {SalesEngineWeb::Invoice.create(customer_id: 12, merchant_id: 2)}
  let(:invoice2) {SalesEngineWeb::Invoice.create(customer_id: 1, merchant_id: 3)}

  describe 'find' do
    context "given an id" do
      it "returns the invoice associated with the id" do
        get "/invoices/find?id=#{invoice1.id}"
        pending
        output = JSON.parse(last_response.body)
        expect( output['id'] ).to eq invoice1.id
        # expect( output['name'] ).to eq invoice1.name
        # expect( [ invoice1.id, invoice2.id ] ).to include( output['id'] )
      end
    end

    context "given a customer id" do
      it "returns an invoice associated with the customer id" do
        pending
      end
    end

    context "given a merchant_id" do
      it "returns an invoice associated with the merchant id" do
        pending
      end
    end

    #DO I NEED THIS ONE? since status is not a unique thing?
    # context "given a status" do
    # end
  end

  describe '/invoices/find_all' do
    context 'given a customer id' do
      it "returns all the invoices associated with the customer id" do
        pending
      end
    end

    context 'given a merchant id' do
      it "returns all the invoices associated with the merchant id" do
        pending
      end
    end

    context 'given a status' do
      it "returns all invoices that have that status" do
        pending
      #example, all not shipped?
      end
    end
  end

  describe 'invoices/random' do
    it "returns a random invoice" do
      pending
    end
  end
end
