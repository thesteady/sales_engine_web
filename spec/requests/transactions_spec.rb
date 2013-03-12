require 'spec_helper'

describe "/transactions/" do
  include Rack::Test::Methods

  def app
    SalesEngineWeb::Server
  end

  describe '/find' do
    context 'given a transaction id' do
      it 'returns the associated transaction' do
        pending
      end
    end

    context 'given an invoice id' do
      it 'returns an associated transaction' do
        pending
      end
    end

    context 'given a credit_card_number' do
      it 'returns an associated transaction' do
        pending
      end
    end

    context 'given a credit_card_expiration_date' do
      it 'returns an associated transaction' do
        pending
      end
    end

    context 'given a result' do
      it 'returns an associated transaction' do
        pending
      end
    end
  end

  describe '/find_all' do
    context 'given an invoice id' do
      it 'returns all associated transactions' do
        pending
      end
    end

    context 'given a credit_card_number' do
      it 'returns all associated transactions' do
        pending
      end
    end

    context 'given a credit_card_expiration_date' do
      it 'returns all associated transactions' do
        pending
      end
    end

    context 'given a result' do
      it 'returns all associated transactions' do
        pending
      end
    end
  end

  describe '/transactions/random' do
    it 'returns a random transaction instance' do
      pending
    end
  end
end
