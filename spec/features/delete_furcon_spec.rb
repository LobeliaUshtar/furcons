require 'spec_helper'

describe "Deleting a furcon" do
	before do
		admin = User.create!(user_attributes(admin: true))
		sign_in(admin)
	end

	it "destroys the furcon and shows the fucon listing without the deleted furcon" do
		furcon = Furcon.create(furcon_attributes)

		visit furcon_path(furcon)
		
		click_link 'Delete'
		
		expect(current_path).to eq(furcons_path)
		expect(page).not_to have_text(furcon.name)
	end

end