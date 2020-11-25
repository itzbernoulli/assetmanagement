require 'rails_helper'

RSpec.describe "buildings/index", type: :view do
  before(:each) do
    assign(:buildings, [
      Building.create!(
        owner: "Owner",
        address: "Address",
        sqmt: 2,
        price: 3.5,
        type: 4
      ),
      Building.create!(
        owner: "Owner",
        address: "Address",
        sqmt: 2,
        price: 3.5,
        type: 4
      )
    ])
  end

  it "renders a list of buildings" do
    render
    assert_select "tr>td", text: "Owner".to_s, count: 2
    assert_select "tr>td", text: "Address".to_s, count: 2
    assert_select "tr>td", text: 2.to_s, count: 2
    assert_select "tr>td", text: 3.5.to_s, count: 2
    assert_select "tr>td", text: 4.to_s, count: 2
  end
end
