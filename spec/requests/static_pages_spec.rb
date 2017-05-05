require 'rails_helper'

describe "Static pages" do 
	describe "Home page" do
		it "should have the title 'Bus tickets'" do
			visit 'static_pages/home'
			expect(page).to have_content('Bus tickets')
		end
	end
end