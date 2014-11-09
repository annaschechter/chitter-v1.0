require 'spec_helper'
require 'helpers/helper_spec'

feature "User signs out" do

	before (:each) do 
		User.create(:name => "Anna",
						:user_name => "annaj",
		        :email => "jerofejeva.anna@yahoo.com",
		        :password => "blah")		
	end

	scenario "while being signed in" do
		visit '/'
		sign_in
		expect(page).to have_content("Current User: Name: Anna Username: annaj")
		click_on "Sign Out"
		expect(page).not_to have_content("Current User: Name: Anna Username: annaj")
	end
	
end