require 'spec_helper'

describe "Viewing the list of users" do

	it "shows the users" do
		user1 = User.create!(user_attributes(name: "Lobelia", email: "lobelia@example.com", username: "Lobelia"))
		user2 = User.create!(user_attributes(name: "Ivan", email: "ivan@example.com", username: "Ivan"))
		user3 = User.create!(user_attributes(name: "Tau", email: "tau@example.com", username: "Tau"))

		sign_in(user1)

		visit users_url

		expect(page).to have_link(user1.name)
		expect(page).to have_link(user2.name)
		expect(page).to have_link(user3.name)
	end

end