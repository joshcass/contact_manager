require 'rails_helper'

RSpec.describe "phone_numbers/edit", type: :view do
  before(:each) do
    @phone_number = assign(:phone_number, PhoneNumber.create!(
        :number => "MyText",
        :contact => Person.create(first_name: "Han", last_name: "Solo")
      ))
  end

  it "renders the edit phone_number form" do
    render

    assert_select "form[action=?][method=?]", phone_number_path(@phone_number), "post" do

      assert_select "textarea#phone_number_number[name=?]", "phone_number[number]"

      assert_select "input#phone_number_contact_id[name=?]", "phone_number[contact_id]"
    end
  end

  it 'shows the contact name in the title' do
    render
    assert_select("h1", text: "Editing Phone Number for #{@phone_number.contact.first_name} #{@phone_number.contact.last_name}")
  end
end
