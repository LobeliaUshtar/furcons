describe "Viewing an individual furcon" do

	it "shows the furcon's details" do
		furcon = Furcon.create(furcon_attributes)

		visit furcon_url(furcon)

		expect(page).to have_text(furcon.name)
		expect(page).to have_text(furcon.website)
		expect(page).to have_text(furcon.location)
		expect(page).to have_text(furcon.theme)
		expect(page).to have_text(furcon.starts_on)
		expect(page).to have_text(furcon.ends_on)
		expect(page).to have_text(furcon.charities)
		expect(page).to have_text(furcon.guest_of_honor)
		expect(page).to have_text(furcon.prereg_by)
		expect(page).to have_selector("img[src$='#{furcon.image_file_name}']")
	end
	
	it "shows the charity if available" do
		furcon = Furcon.create(furcon_attributes(charities: "Charity"))

		visit furcon_url(furcon)

		expect(page).to have_text("Charity")
	end
	it "shows 'No Charity Yet' if the charity is not available" do
		furcon = Furcon.create(furcon_attributes(charities: ""))

		visit furcon_url(furcon)

		expect(page).to have_text("No Charity Yet")
	end

	it "includes the furcon's name in the page title" do
		furcon = Furcon.create!(furcon_attributes)

		visit furcon_url(furcon)

		expect(page).to have_title("Furcons - #{furcon.name}")
	end

	it "has an SEO-friendly URL" do
		furcon = Furcon.create!(furcon_attributes(name: "Gabby Con"))

		visit furcon_url(furcon)

		expect(current_path).to eq("/furcons/gabby-con")
	end
end