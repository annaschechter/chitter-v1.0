require 'spec_helper'


def sign_up(name="Anna", user_name="annaj", email="jerofejeva.anna@yahoo.com", password="blah")
	visit '/users/new'
	fill_in :name, :with => name
	fill_in :user_name, :with => user_name
	fill_in :email, :with => email
	fill_in :password, :with => password
	click_on "Sign Up"
end

def sign_in(email="jerofejeva.anna@yahoo.com", password="blah")
	visit '/sessions/new'
	fill_in :email, :with => email
	fill_in :password, :with => password
	click_on "Sign In"
end

def post_peep
	visit '/peeps/new'
	fill_in :message, :with => "Hey, I am Anna"
	click_on "Post"
end

