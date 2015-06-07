require 'rails_helper'

RSpec.describe Company, type: :model do
  let(:company) { Company.new(name: "Empire")}

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
end
