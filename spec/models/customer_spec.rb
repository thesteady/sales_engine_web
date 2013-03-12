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

    describe '.find_by_first_name(first_name)' do
      it 'returns a customer object' do
        target = Customer.create({first_name: 'Pumpkin', last_name: 'Pie'})
        found = Customer.find_by_first_name(target.first_name)
        expect(found.id).to eq target.id
      end
    end

      describe '.find_by_first_name(first_name), partial string' do
        it 'returns a customer object that matches' do
        target = Customer.create({first_name: 'Sally', last_name: 'Pizza'})
        found = Customer.find_by_first_name('Sal')
        expect(found.id).to eq target.id
        end
      end

      describe '.find_by_first_name(first_name), case insensitive' do
        it 'returns a customer object that matches' do
        target = Customer.create({first_name: 'Sally', last_name: 'Pizza'})
        found = Customer.find_by_first_name('sally')
        expect(found.id).to eq target.id
        end
      end

      describe '.find_by_last_name(last_name)' do
        it 'returns a customer object that matches' do
        target = Customer.create({first_name: 'Sally', last_name: 'Pizza'})
        found = Customer.find_by_last_name('Pizza')
        expect(found.id).to eq target.id
        end
      end

      describe '.find_by_last_name(last_name), case insensitive' do
        it 'returns a customer object that matches' do
        target = Customer.create({first_name: 'Sally', last_name: 'Pizza'})
        found = Customer.find_by_last_name('pizza')
        expect(found.id).to eq target.id
        end
      end

  end
end
