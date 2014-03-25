require 'spec_helper'

describe "Viewing the list of furcons" do

	it "shows the furcons" do
		furcon = Furcon.create(furcon_attributes)

		visit furcons_url

		expect(page).to have_text(furcon.name)
		expect(page).to have_text(furcon.website)
		expect(page).to have_text(furcon.location)
		expect(page).to have_text(furcon.starts_on)
		expect(page).to have_text(furcon.ends_on)
		expect(page).to have_selector("img[src$='#{furcon.image_file_name}']")
	end
	
	it "does show furcons in order" do
		furcon = Furcon.create(furcon_attributes(starts_on: :asc))
		
		visit furcons_path
		
		expect(page).to have_text(furcon.name)
	end

end