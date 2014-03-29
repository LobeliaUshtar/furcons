require 'spec_helper'

describe "Viewing a user's profile page" do

	it "shows the user's details" do
		user = User.create!(user_attributes)

		sign_in(user)

		visit user_url(user)

		expect(page).to have_text(user.name)
		expect(page).to have_text(user.email)
		expect(page).to have_text(user.username)
	end

	it "includes the user's name in the page title" do
		user = User.create!(user_attributes)

		sign_in(user)

		visit user_url(user)

		expect(page).to have_title("Furcons - #{user.name}")
	end

	it "has an SEO-friendly URL" do
		user = User.create!(user_attributes(name: "Example User"))

		sign_in(user)

		visit user_url(user)

		expect(current_path).to eq("/users/example-user")
	end
end