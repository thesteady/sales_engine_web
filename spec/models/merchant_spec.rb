require 'spec_helper'

module SalesEngineWeb
  describe Merchant do
    describe '.create' do
      it 'creates a merchant' do
        merchant = Merchant.create(:name => "Jumpstart Lab")
        expect( merchant.name ).to eq "Jumpstart Lab"
      end
    end

    describe '.find' do
      it "finds a merchant" do
        target = Merchant.create(:name => "Jumpstart Lab")
        found  = Merchant.find( target.id )
        expect( found.id ).to eq target.id
        expect( found.name ).to eq target.name
      end
    end

    describe '.find_by_name' do
      it "finds a merchant by name" do
        target = Merchant.create(:name => "Jumpstart Lab")
        found  = Merchant.find_by_name("Jumpstart Lab")
        # expect( found.id ).to eq target.id
        expect( found.name ).to eq target.name
      end

      it "finds by name, case insensitive" do
        target = Merchant.create(:name => "Jumpstart Lab")
        found  = Merchant.find_by_name("jumpstart lab")
        # expect( found.id ).to eq target.id
        expect( found.name ).to eq target.name
      end
    end

    describe '.find_all_by_name' do
      before (:each) do
        Merchant.create(:name => "Julies My Shop")
        Merchant.create(:name => "My Shop at Harrys")
      end

      it "finds all merchants with a substring in name" do
        results = Merchant.find_all_by_name("My Shop")
        expect(results.count).to eq 2
      end

      it "finds all merchants with substring, case insensitive" do
        results = Merchant.find_all_by_name("my shop")
        expect(results.count).to eq 2
      end

      it "returns 0 or an empty array when there are no matches" do
        pending
      end
    end

    describe ".random" do
      it "returns a merchant" do
        Merchant.create(:name => "Jumpstart Lab")
        expect( Merchant.random ).to be_kind_of(Merchant)
      end
    end

    describe "#to_hash" do
      it "retunrs back a hash of merchant data" do
        merchant = Merchant.create(:name => "Jumpstart Lab")
        merch_hash = merchant.to_hash
        expect(merch_hash[:name]).to eq "Jumpstart Lab"
      end
    end
  end
end
