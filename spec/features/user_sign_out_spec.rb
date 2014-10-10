require 'spec_helper'

feature "User signs out" do

	before (:each) do 
		User.create(:name => "Anna",
						:user_name => "annaj",
		                :email => "jerofejeva.anna@yahoo.com",
		                :password => "blah")		
	end

	scenario "while being signed in" do
		visit '/'
		sign_in("jerofejeva.anna@yahoo.com", "blah")
		expect(page).to have_content("You are signed in as annaj")
		click_on "Sign Out"
		expect(page).not_to have_content("You are signed in as annaj")
	end

	def sign_in(email, password)
		visit '/sessions/new'
		fill_in :email, :with => email
		fill_in :password, :with => password
		click_on "Sign In"
	end
end