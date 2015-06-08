require 'rails_helper'

RSpec.describe "phone_numbers/new", type: :view do
  before(:each) do
    @phone_number = assign(:phone_number, PhoneNumber.new(
      :number => "MyText",
      :contact => Person.create(first_name: "Han", last_name: "Solo")
    ))
  end

  it "renders new phone_number form" do
    render

    assert_select "form[action=?][method=?]", phone_numbers_path, "post" do

      assert_select "textarea#phone_number_number[name=?]", "phone_number[number]"

      assert_select "input#phone_number_contact_id[name=?]", "phone_number[contact_id]"
    end
  end

  it 'shows the contact name in the title' do
    render
    assert_select("h1", text: "New Phone Number for #{@phone_number.contact.first_name} #{@phone_number.contact.last_name}")
  end
end
