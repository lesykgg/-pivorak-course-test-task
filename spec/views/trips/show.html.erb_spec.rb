require 'rails_helper'

RSpec.describe "trips/show", type: :view do
  before(:each) do
    @trip = assign(:trip, Trip.create!(
      :from => "From",
      :destination => "Destination",
      :via => "Via",
      :seats => 2
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/From/)
    expect(rendered).to match(/Destination/)
    expect(rendered).to match(/Via/)
    expect(rendered).to match(/2/)
  end
end
