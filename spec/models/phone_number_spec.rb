require 'rails_helper'

RSpec.describe PhoneNumber, type: :model do
  let(:phone_number) { PhoneNumber.new(number: "1112223333", person_id: 1) }

  it 'is valid' do
    expect(phone_number).to be_valid
  end

  it 'is invalid wihout a number' do
    phone_number.number = nil
    expect(phone_number).to_not be_valid
  end

  it 'has to have a person_id' do
    phone_number.person_id = nil
    expect(phone_number).to_not be_valid
  end

  it 'is associated with a person' do
    expect(phone_number).to respond_to(:person)
  end
end
