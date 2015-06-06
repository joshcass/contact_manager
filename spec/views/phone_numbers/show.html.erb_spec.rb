require 'rails_helper'

RSpec.describe "phone_numbers/show", type: :view do
  before(:each) do
    @phone_number = assign(:phone_number, PhoneNumber.create!(
      :number => "MyText",
      :person => Person.create(first_name: "Han", last_name: "Solo")
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/MyText/)
    expect(rendered).to match(//)
  end
end
