require 'spec_helper'

describe "Filtering Users" do

	it "shows 'Edit Users' in the sidebar if admin is signed in" do
		before do
			admin = User.create!(user_attributes(admin: true))
			sign_in(admin)
		end

		visit furcons_url

		click_link "Edit Users"

		expect(current_path).to eq("/furcons/users")
	end

	it "doesn't show 'Edit Users' in the sidebar if admin isn't signed in" do
		before do
			not_admin = User.create!(user_attributes)
			sign_in(not_admin)
		end

		visit furcons_url

		expect(page).not_to have_text("Edit Users")
	end

end