require 'rails_helper'

RSpec.describe "phone_numbers/index", type: :view do
  before(:each) do
    assign(:phone_numbers, [
      PhoneNumber.create!(
        :number => "MyText",
        :person => Person.create(first_name: "Han", last_name: "Solo")
      ),
      PhoneNumber.create!(
        :number => "MyText",
        :person => Person.create(first_name: "Han", last_name: "Solo")
      )
    ])
  end

  it "renders a list of phone_numbers" do
    render
    assert_select "tr>td", :text => "MyText".to_s, :count => 2
  end
end
