require 'rails_helper'

describe "Static pages" do 
	describe "Home page" do
		it "should have the title 'Bus tickets online'" do
			visit root_path
			expect(page).to have_title('Bus tickets online')
		end
	end
end