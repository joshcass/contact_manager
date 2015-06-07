require 'rails_helper'

RSpec.describe Person, type: :model do
  let(:person) do
    Person.new(first_name: "Han", last_name: "Solo")
  end

  it 'is valid' do
    expect(person).to be_valid
  end

  it 'is invalid without a first name' do
    person.first_name = nil
    expect(person).not_to be_valid
  end

  it 'is invalid without a last name' do
    person.last_name = nil
    expect(person).not_to be_valid
  end

  it 'has an array of phone numbers' do
    person.phone_numbers.new(number: "555-6666")
    expect(person.phone_numbers.map(&:number)).to eq ["555-6666"]
  end

  it 'has an array of email addresses' do
    person.email_addresses.new(address: "han@solo.com")
    expect(person.email_addresses.map(&:address)).to eq ["han@solo.com"]
  end
end

