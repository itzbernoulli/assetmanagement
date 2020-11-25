require 'rails_helper'

RSpec.describe "buildings/new", type: :view do
  before(:each) do
    assign(:building, Building.new(
      owner: "MyString",
      address: "MyString",
      sqmt: 1,
      price: 1.5,
      type: 1
    ))
  end

  it "renders new building form" do
    render

    assert_select "form[action=?][method=?]", buildings_path, "post" do

      assert_select "input[name=?]", "building[owner]"

      assert_select "input[name=?]", "building[address]"

      assert_select "input[name=?]", "building[sqmt]"

      assert_select "input[name=?]", "building[price]"

      assert_select "input[name=?]", "building[type]"
    end
  end
end
