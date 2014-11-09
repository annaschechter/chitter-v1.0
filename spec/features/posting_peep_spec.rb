require 'spec_helper'
require 'helpers/helper_spec'

feature "User posts a gossip" do

	before (:each) do 
		User.create(:name => "Anna",
								:user_name => "annaj",
		            :email => "jerofejeva.anna@yahoo.com",
		            :password => "blah")
	end

	scenario "when signed in" do
		sign_in
		post_peep
		expect(page).to have_content("Chitter")
	end

	scenario "when signed out" do
		visit '/'
		click_on "Post your gossip"
		expect(page).to have_content("You need to sign in to post on Chitter")
	end

end

