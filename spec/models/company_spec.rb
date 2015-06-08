require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:company) { Company.new(name: "The Empire")}

  it 'is valid' do
    expect(company).to be_valid
  end

  it 'is not valid without a name' do
    company.name = nil
    expect(company).to_not be_valid
  end

  it 'has an array of phone numbers' do
    company.phone_numbers.new(number: "555-1212")
    expect(company.phone_numbers.map(&:number)).to eq ["555-1212"]
  end

  it 'has an array of email addresses' do
    company.email_addresses.new(address: "han@solo.com")
    expect(company.email_addresses.map(&:address)).to eq ["han@solo.com"]
  end

  it 'converts to a string with the name' do
    expect(company.to_s).to eq "The Empire"
  end
end
