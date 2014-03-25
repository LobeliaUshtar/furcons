require 'spec_helper'

describe "Deleting a membership" do
	before do
		admin = User.create!(user_attributes(admin: true))
		sign_in(admin)
	end

=begin
	it "destroys the membership and shows the furcon's membership listing without the deleted membership" do
		furcon = Furcon.create(furcon_attributes)

		visit furcon_path(furcon)
		
		click_link 'Delete'
		
		expect(current_path).to eq(furcons_path)
		expect(page).not_to have_text(furcon.name)
	end
=end
end