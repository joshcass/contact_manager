require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.new(name: "Joe", uid: "12345", provider: "twitter", image: "www.picture.com") }

  it 'is valid' do
    expect(user).to be_valid
  end
end
