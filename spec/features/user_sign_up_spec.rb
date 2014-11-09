require 'spec_helper'
require 'helpers/helper_spec'

feature "User signs up" do

	scenario "with all details" do
		expect{sign_up}.to change(User, :count).by(1)
		expect(page).to have_content("Current User: Name: Anna Username: annaj")
	end

	scenario "with an email that is already registered" do
		expect{sign_up}.to change(User, :count).by(1)
		expect{sign_up("Anna", "janna", "jerofejeva.anna@yahoo.com", "boom")}.to change(User, :count).by(0)
		expect(page).to have_content("This username or email is already taken")
	end

	scenario "with an user name that is already registered" do
		expect{sign_up}.to change(User, :count).by(1)
		expect{sign_up("Anna", "annaj", "anna.jerofejeva@yahoo.com", "boom")}.to change(User, :count).by(0)
		expect(page).to have_content("This username or email is already taken")
	end

end
