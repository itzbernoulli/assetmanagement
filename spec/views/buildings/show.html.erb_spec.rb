require 'rails_helper'

RSpec.describe "buildings/show", type: :view do
  before(:each) do
    @building = assign(:building, Building.create!(
      owner: "Owner",
      address: "Address",
      sqmt: 2,
      price: 3.5,
      type: 4
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Owner/)
    expect(rendered).to match(/Address/)
    expect(rendered).to match(/2/)
    expect(rendered).to match(/3.5/)
    expect(rendered).to match(/4/)
  end
end
