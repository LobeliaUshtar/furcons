require 'spec_helper'

describe "Creating a new membership" do
	before do
		admin = User.create!(user_attributes(admin: true))
		sign_in(admin)
	end

	it "saves the membership" do		
		furcon = Furcon.create(furcon_attributes)

		visit furcon_url(furcon)
		
		click_link 'Add a Membership'
		
		expect(current_path).to eq(new_furcon_membership_path(furcon))
		
		fill_in "Name", with: "Lover"
		fill_in "Prereg fee", with: 25.00
		fill_in "Reg fee", with: 50.00
		fill_in "Swag", with: "Sex! Love luscious Sex!!"
						
		click_button 'Create Membership'
	
		expect(current_path).to eq(furcon_memberships_path(furcon))
		
		expect(page).to have_text("Membership added!")
	end
	
	it "does not save the new membership if it's invalid" do
		furcon = Furcon.create(furcon_attributes)
		
		visit new_furcon_membership_url(furcon)
		
		expect { 
			click_button 'Create Membership' 
		}.not_to change(Membership, :count)
		
		expect(page).to have_text('error')
	end

end