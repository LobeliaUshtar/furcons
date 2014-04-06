require 'spec_helper'

describe "Filtering Users" do

	it "shows 'Edit Users' in the sidebar if admin is signed in" do
		admin = User.create!(user_attributes(admin: true))
		sign_in(admin)

		visit furcons_url

		click_link "Edit Users"

		expect(current_path).to eq(users_path)
	end

	it "doesn't show 'Edit Users' in the sidebar if admin isn't signed in" do
		not_admin = User.create!(user_attributes)
		sign_in(not_admin)

		visit furcons_url

		expect(page).not_to have_text("Edit Users")
	end

end