require 'rails_helper'

RSpec.describe "people/index", type: :view do
  before(:each) do
    assign(:people, [
      Person.create!(
        :first_name => "MyText",
        :last_name => "MyOtherText"
      ),
      Person.create!(
        :first_name => "MyText",
        :last_name => "MyOtherText"
      )
    ])
  end

  it "renders a list of people" do
    render
    assert_select "tr>td", :text => "MyText MyOtherText".to_s, :count => 2
  end
end
