require './lib/sales_engine_web/models/merchant'

module SalesEngineWeb
  describe Merchant do
    describe '.create' do
      it 'creates a merchant' do
        merchant = Merchant.create(:id => 12, :name => "Jumpstart Lab")
        expect( merchant.id ).to eq 12
        expect( merchant.name ).to eq "Jumpstart Lab"
      end
    end

    describe '.find' do
      it "finds a merchant" do
        target = Merchant.create(:id => 12, :name => "Jumpstart Lab")
        found  = Merchant.find(12)
        expect( found.id ).to eq target.id
        expect( found.name ).to eq target.name
      end
    end
  end
end