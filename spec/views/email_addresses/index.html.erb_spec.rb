require 'rails_helper'

RSpec.describe "email_addresses/index", type: :view do
  before(:each) do
    assign(:email_addresses, [
      EmailAddress.create!(
        :address => "MyText",
        :contact => Person.create(first_name: "Han", last_name: "Solo")
      ),
      EmailAddress.create!(
        :address => "MyText",
        :contact => Person.create(first_name: "Boba", last_name: "Fett")
      )
    ])
  end

  it "renders a list of email_addresses" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
