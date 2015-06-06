require 'rails_helper'

RSpec.describe EmailAddress, type: :model do
  let(:email) {EmailAddress.new(address: "han@solo.com", person_id: 1)}

  it 'is valid' do
    expect(email).to be_valid
  end
  it 'is invalid without an address' do
    email.address = nil
    expect(email).to_not be_valid
  end

  it 'is invalid without a person id' do
    email.person_id = nil
    expect(email).to_not be_valid
  end

  it 'is associated with a person' do
    expect(email).to respond_to(:person)
  end
end
