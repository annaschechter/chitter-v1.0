require 'spec_helper'

feature "User posts a peep" do

	before (:each) do 
		User.create(:name => "Anna",
						:user_name => "annaj",
		                :email => "jerofejeva.anna@yahoo.com",
		                :password => "blah")
	end

	scenario "when signed in" do
		sign_in("jerofejeva.anna@yahoo.com", "blah")
		click_on "Post a Peep"
		post_peep
		expect(page).to have_content("Chitter")
	end

	def post_peep
		visit '/peeps/new'
		fill_in :message, :with => "Hey, I am Anna"
		click_on "Post"
	end

	def sign_in(email, password)
		visit '/sessions/new'
		fill_in :email, :with => email
		fill_in :password, :with => password
		click_on "Sign In"
	end
end

