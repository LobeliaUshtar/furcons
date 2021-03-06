require 'spec_helper'

describe "Creating a new furcon" do
	before do
		admin = User.create!(user_attributes(admin: true))
		sign_in(admin)
	end

	it "saves the furcon and shows the new furcon's details" do
		visit furcons_url
		
		click_link 'Add New Furcon'
		
		expect(current_path).to eq(new_furcon_path)
		
		fill_in "Name", with: "New Furcon Name"
		fill_in "Website", with: "http://SweetiePie.com"
		fill_in "Location", with: "Budd Lake, NJ"
		fill_in "Theme", with: "GO WEST!!!"
		select (Time.now.year - 1).to_s, from: "furcon_starts_on_1i"
		select (Time.now.year - 1).to_s, from: "furcon_ends_on_1i"
		fill_in "Charities", with: "LU to CA"
		fill_in "Guest of honor", with: "Ivanhorse Titanium"
		select (Time.now.year - 1).to_s, from: "furcon_prereg_by_1i"
		fill_in "Image file name", with: "furcon.png"
		 
		click_button 'Create Furcon'

		expect(current_path).to eq(furcon_path(Furcon.last))
		
		expect(page).to have_text('Furcon successfully created!')
	end

	it "does not save the furcon if it's invalid" do
		visit new_furcon_url
		
		expect { 
			click_button 'Create Furcon' 
		}.not_to change(Furcon, :count)
		
		expect(current_path).to eq(furcons_path)	 
		expect(page).to have_text('error')
	end

end