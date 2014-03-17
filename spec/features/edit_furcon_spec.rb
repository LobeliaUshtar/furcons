require 'spec_helper'

describe "Editing a furcon" do
	before do
		admin = User.create!(user_attributes(admin: true))
		sign_in(admin)
	end
	
	it "updates the furcon and shows the furcon's updated details" do
		furcon = Furcon.create(furcon_attributes)
		
		visit furcon_url(furcon)
		
		click_link 'Edit'
		
		expect(current_path).to eq(edit_furcon_path(furcon))
				
		expect(find_field('Name').value).to eq(furcon.name)

		fill_in 'Name', with: "Updated Furcon Name"

		click_button 'Update Furcon'

		expect(current_path).to eq(furcon_path(furcon))

		expect(page).to have_text('Furcon successfully updated!')
	end

	it "does not update the furcon if it's invalid" do
		furcon = Furcon.create(furcon_attributes)
		
		visit edit_furcon_url(furcon)
		
		fill_in 'Name', with: " "
		
		click_button 'Update Furcon' 
		
		expect(page).to have_text('error')
	end
	
end