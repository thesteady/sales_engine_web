require 'spec_helper'

module SalesEngineWeb
  describe Customer do

    describe '.create' do
      it 'returns a customer object' do
        customer = Customer.create({first_name: 'Jerry', last_name: 'Seinfeld'})
        puts customer.inspect

        expect(customer.first_name).to eq 'Jerry'
        expect(customer.last_name).to eq "Seinfeld"
      end
    end

    describe '.find(id)' do
      it 'returns a customer object' do
        target = Customer.create({first_name: 'Jerry', last_name: 'Seinfeld'})
        found = Customer.find(target.id)
        expect(found.id).to eq target.id
      end
    end
  end
end
