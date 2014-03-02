require 'spec_helper'

describe "Creating a new furcon" do

	it "saves the furcon and shows the new furcon's details" do
		visit furcons_url
		
		click_link 'Add New Furcon'
		
		expect(current_path).to eq(new_furcon_path)
		
		fill_in "Name", with: "New Furcon Name"
		fill_in "Website", with: "http://SweetiePie.com"
		fill_in "Location", with: "Budd Lake, NJ"
		fill_in "Theme", with: "GO WEST!!!"
		# fill_in "Starts on", with: "2014-04-17"
		# fill_in "Ends on", with: "2014-10-24"
		fill_in "Charities", with: "LU to CA"
		fill_in "Guest of honor", with: "Ivanhorse Titanium"
		# fill_in "Prereg by", with: "2014-03-01"
		fill_in "Image file name", with: "furcon.png"

		# If you're taking advantage of the HTML 5 date field in Chrome, 
		# you'll need to use 'fill_in' rather than 'select'
		# fill_in "Released on", with: (Time.now.year - 1).to_s
		 
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