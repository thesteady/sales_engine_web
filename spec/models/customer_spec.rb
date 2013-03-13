require 'spec_helper'

module SalesEngineWeb
  describe Customer do

let(:customer1) {Customer.create(first_name: 'Jerry', last_name: 'Seinfeld')}

    describe '.create' do
      it 'returns a customer object' do
        customer = Customer.create({first_name: 'Jerry', last_name: 'Seinfeld'})
        expect(customer.first_name).to eq 'Jerry'
        expect(customer.last_name).to eq "Seinfeld"
      end
    end

    describe '.find(id)' do
      it 'returns a customer object' do
        target = customer1
        found = Customer.find(target.id)
        expect(found.id).to eq target.id
      end
    end

    describe '.find_by_first_name(first_name)' do
      it 'returns a customer object' do
        target = customer1
        found = Customer.find_by_first_name(target.first_name)
        expect(found.id).to eq target.id
      end
    end

      describe '.find_by_first_name(first_name), partial string' do
        it 'returns a customer object that matches' do
        target = customer1
        found = Customer.find_by_first_name('Jer')
        expect(found.id).to eq target.id
        end
      end

      describe '.find_by_first_name(first_name), case insensitive' do
        it 'returns a customer object that matches' do
        target = customer1
        found = Customer.find_by_first_name('JERRY')
        expect(found.id).to eq target.id
        end
      end

      describe '.find_by_last_name(last_name)' do
        it 'returns a customer object that matches' do
        target = customer1
        found = Customer.find_by_last_name('Seinfeld')
        expect(found.id).to eq target.id
        end
      end
###
      # describe find by last name partial string
###
      describe '.find_by_last_name(last_name), case insensitive' do
        it 'returns a customer object that matches' do
        target = customer1
        found = Customer.find_by_last_name('seinfeld')
        expect(found.id).to eq target.id
        end
      end

      describe '.find_all_by_first_name(first_name)' do
      it 'returns a customer object' do
        target = customer1
        Customer.create({first_name: 'Jerry', last_name: 'Jones'})
        found = Customer.find_all_by_first_name('Jerry')
        expect(found.count).to eq 2
      end
    end

    describe '.find_all_by_first_name(first_name)' do
      it 'returns a customer object' do
        target = customer1
        Customer.create({first_name: 'Denny', last_name: 'Seinfeld'})
        found = Customer.find_all_by_last_name('Seinfeld')
        expect(found.count).to eq 2
      end
    end

    describe '.random' do
      it 'returns a random customer object' do
        customer1
        Customer.create({first_name: 'Denny', last_name: 'Seinfeld'})
        customer = Customer.random
        expect(customer).to be_kind_of Customer
      end
    end
  end
end
