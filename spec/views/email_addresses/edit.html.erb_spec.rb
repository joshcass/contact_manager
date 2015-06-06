require 'rails_helper'

RSpec.describe "email_addresses/edit", type: :view do
  before(:each) do
    @email_address = assign(:email_address, EmailAddress.create!(
      :address => "MyText",
      :person => Person.create(first_name: "Han", last_name: "Solo")
    ))
  end

  it "renders the edit email_address form" do
    render

    assert_select "form[action=?][method=?]", email_address_path(@email_address), "post" do

      assert_select "textarea#email_address_address[name=?]", "email_address[address]"

      assert_select "input#email_address_person_id[name=?]", "email_address[person_id]"
    end
  end
end