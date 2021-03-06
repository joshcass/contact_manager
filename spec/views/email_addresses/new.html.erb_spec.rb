require 'rails_helper'

RSpec.describe "email_addresses/new", type: :view do
  before(:each) do
    @email_address = assign(:email_address, EmailAddress.new(
        :address => "MyText",
        :contact => Person.create(first_name: "Han", last_name: "Solo")
      ))
  end

  it "renders new email_address form" do
    render

    assert_select "form[action=?][method=?]", email_addresses_path, "post" do

      assert_select "textarea#email_address_address[name=?]", "email_address[address]"

      assert_select "input#email_address_contact_id[name=?]", "email_address[contact_id]"
    end
  end

  it 'shows the contact name in the title' do
    render
    assert_select("h1", text: "New Email Address for #{@email_address.contact.first_name} #{@email_address.contact.last_name}")
  end
end
