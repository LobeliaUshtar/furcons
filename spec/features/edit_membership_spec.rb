require 'spec_helper'

describe "Editing a membership" do
	before do
		admin = User.create!(user_attributes(admin: true))
		sign_in(admin)
	end

	it "updates the membership and shows the furcon's membership listing" do
		furcon = Furcon.create(furcon_attributes)
		
		visit furcon_memberships_url(furcon)
		
		click_link 'Edit Me'	# unable to find link
		
		expect(current_path).to eq(edit_furcon_membership_path(furcon))
				
		expect(find_field('Name').value).to eq(membership.name)

		fill_in 'Name', with: "Updated Membership Name"

		click_button 'Update Membership'

		expect(current_path).to eq(furcon_memberships_path(furcon))

		expect(page).to have_text('Membership successfully updated!')
	end

	it "does not update the membership if it's invalid" do
		furcon = Furcon.create(furcon_attributes)
		
		visit edit_furcon_membership_url(furcon)	# no route matches
		
		fill_in 'Name', with: " "
		
		click_button 'Update Membership' 
		
		expect(page).to have_text('error')
	end

end