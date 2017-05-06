require 'rails_helper'

RSpec.describe "trips/new", type: :view do
  before(:each) do
    assign(:trip, Trip.new(
      :from => "MyString",
      :destination => "MyString",
      :via => "MyString",
      :seats => 1
    ))
  end

  it "renders new trip form" do
    render

    assert_select "form[action=?][method=?]", trips_path, "post" do

      assert_select "input#trip_from[name=?]", "trip[from]"

      assert_select "input#trip_destination[name=?]", "trip[destination]"

      assert_select "input#trip_via[name=?]", "trip[via]"

      assert_select "input#trip_seats[name=?]", "trip[seats]"
    end
  end
end
