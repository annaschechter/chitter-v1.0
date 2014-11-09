require 'spec_helper'
require 'helpers/helper_spec'

feature "User signs in" do

	before (:each) do 
		User.create(:name => "Anna",
								:user_name => "annaj",
				        :email => "jerofejeva.anna@yahoo.com",
				        :password => "blah")		
	end

	scenario "with correct credentials" do
		visit '/'
		expect(page).not_to have_content("Current User: Name: Anna Username: annaj")
		sign_in
		expect(page).to have_content("Current User: Name: Anna Username: annaj")
	end

	scenario "with incorrect credentials" do
		visit '/'
		expect(page).not_to have_content("Current User: Name: Anna Username: annaj")
		sign_in("jerofejeva.anna@yahoo.com", "boom")
		expect(page).to have_content("The email or password is incorrect")
	end

end