require 'spec_helper'
require 'helpers/helper_spec'

feature "User posts a reply to a gossip" do
	before (:each) do 
		User.create(:name => "Anna",
								:user_name => "annaj",
		            :email => "jerofejeva.anna@yahoo.com",
		            :password => "blah")
	end

	it 'when signed in' do
		sign_in
		post_peep
		click_link 'Reply'
		fill_in :message, :with => "Hey Anna"
		click_on "Post"
		expect(page).to have_content "See Replies(1)"
	end

	it 'when not signed in' do
		sign_in
		post_peep
		click_on 'Sign Out'
		click_link 'Reply'
		expect(page).to have_content "You need to sign in to reply on Chitter"
	end

end