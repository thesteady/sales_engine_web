require 'spec_helper'

describe "/invoices/" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

  describe '/invoices/find' do
    context "given an id" do
      it "returns the invoice associated with the id" do
        pending
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
