require 'rails_helper'

RSpec.describe "email_addresses/show", type: :view do
  before(:each) do
    @email_address = assign(:email_address, EmailAddress.create!(
      :address => "MyText",
      :contact => Person.create(first_name: "Han", last_name: "Solo")
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
