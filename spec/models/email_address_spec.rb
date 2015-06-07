require 'rails_helper'

RSpec.describe EmailAddress, type: :model do
  let(:person) { Person.create(first_name: "Han", last_name: "Solot")}
  let(:email) {EmailAddress.new(address: "han@solo.com", contact_id: person.id, contact_type: "Person")}

  it 'is valid' do
    expect(email).to be_valid
  end
  it 'is invalid without an address' do
    email.address = nil
    expect(email).to_not be_valid
  end

  it 'is invalid without a contact id' do
    email.contact_id = nil
    expect(email).to_not be_valid
  end

  it 'is associated with a contact' do
    expect(email).to respond_to(:contact)
  end
end
