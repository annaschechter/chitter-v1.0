require 'spec_helper'

feature "User signs up" do

	scenario "with all details" do
		expect{sign_up("Anna", "annaj", "jerofejeva.anna@yahoo.com", "blah")}.to change(User, :count).by(1)
		expect(page).to have_content("You are signed in as annaj")
	end

	scenario "with an email that is already registered" do
		expect{sign_up("Anna", "annaj", "jerofejeva.anna@yahoo.com", "blah")}.to change(User, :count).by(1)
		expect{sign_up("Anna", "janna", "jerofejeva.anna@yahoo.com", "boom")}.to change(User, :count).by(0)
		expect(page).to have_content("This username or email is already taken")
	end

	scenario "with an user name that is already registered" do
		expect{sign_up("Anna", "annaj", "jerofejeva.anna@yahoo.com", "blah")}.to change(User, :count).by(1)
		expect{sign_up("Anna", "annaj", "anna.jerofejeva@yahoo.com", "boom")}.to change(User, :count).by(0)
		expect(page).to have_content("This username or email is already taken")
	end

	def sign_up(name, user_name, email, password)
		visit '/users/new'
		fill_in :name, :with => name
		fill_in :user_name, :with => user_name
		fill_in :email, :with => email
		fill_in :password, :with => password
		click_on "Sign Up"
	end
end
