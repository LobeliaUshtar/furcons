require 'spec_helper'

describe "Filtering furcons" do

	it "shows all furcons" do
		furcon = Furcon.create!(furcon_attributes)

		visit furcons_url

		click_link "All Furcons"

		expect(current_path).to eq("/furcons/everything")

		expect(page).to have_text(furcon.name)
	end

	it "shows upcoming furcons" do
		furcon = Furcon.create!(furcon_attributes(starts_on: 1.day.from_now))

		visit furcons_url

		click_link "Upcoming"

		expect(current_path).to eq("/furcons")

		expect(page).to have_text(furcon.name)
	end

	it "shows upcoming furcons that you can still prereg for" do
		furcon = Furcon.create!(furcon_attributes(prereg_by: 1.month.from_now, starts_on: 2.month.from_now))

		visit furcons_url

		click_link "Can still PreReg!"

		expect(current_path).to eq("/furcons/upcoming_prereg")

		expect(page).to have_text(furcon.name)
	end

	it "shows past furcons" do
		furcon = Furcon.create!(furcon_attributes(starts_on: 1.day.ago))

		visit furcons_url

		click_link "Past"

		expect(current_path).to eq("/furcons/past")

		expect(page).to have_text(furcon.name)
	end

	it "shows recent furcons" do
		furcon = Furcon.create!(furcon_attributes(starts_on: 1.day.ago))

		visit furcons_url

		click_link "Recent"

		expect(current_path).to eq("/furcons/recent")

		expect(page).to have_text(furcon.name)
	end
end