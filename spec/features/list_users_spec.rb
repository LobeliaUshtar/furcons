require 'spec_helper'

describe "Viewing the list of users" do
	before do
		@user1 = User.create!(user_attributes(name: "Lobelia", email: "lobelia@example.com", username: "Lobelia"))
		@user2 = User.create!(user_attributes(name: "Ivan", email: "ivan@example.com", username: "Ivan"))
		@user3 = User.create!(user_attributes(name: "Tau", email: "tau@example.com", username: "Tau"))
		@admin = User.create!(user_attributes(admin: true))
	end

	it "shows the users" do
		sign_in(@user1)

		visit users_url

		expect(page).to have_link(@user1.name)
		expect(page).to have_link(@user2.name)
		expect(page).to have_link(@user3.name)
		expect(page).not_to have_link(@admin.name)
	end

	it "shows the admin a way to set other admin" do
		sign_in(@admin)

		visit users_url

		expect(page).to have_link(@user1.name)
		expect(page).to have_link(@user2.name)
		expect(page).to have_link(@user3.name)
		expect(page).to have_link(@admin.name)
	end

end