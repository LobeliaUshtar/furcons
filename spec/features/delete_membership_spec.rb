require 'spec_helper'

describe "Deleting a membership" do
	before do
		admin = User.create!(user_attributes(admin: true))
		sign_in(admin)
	end

	it "destroys the membership and shows the furcon's membership listing without the deleted membership" do
		furcon = Furcon.create(furcon_attributes)

		visit furcon_memberships_path(furcon)
		
		click_link 'Delete Me'	# unable to find link
		
		expect(current_path).to eq(furcon_memberships_path)
		expect(page).not_to have_text(membership.name)
	end

end