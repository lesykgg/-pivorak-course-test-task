require 'rails_helper'

RSpec.describe "trips/index", type: :view do
  before(:each) do
    assign(:trips, [
      Trip.create!(
        :from => "From",
        :destination => "Destination",
        :via => "Via",
        :seats => 2
      ),
      Trip.create!(
        :from => "From",
        :destination => "Destination",
        :via => "Via",
        :seats => 2
      )
    ])
  end

  it "renders a list of trips" do
    render
    assert_select "tr>td", :text => "From".to_s, :count => 2
    assert_select "tr>td", :text => "Destination".to_s, :count => 2
    assert_select "tr>td", :text => "Via".to_s, :count => 2
    assert_select "tr>td", :text => 2.to_s, :count => 2
  end
end
