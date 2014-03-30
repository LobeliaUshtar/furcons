require 'spec_helper'

describe "Navigating furcons" do

	it "allows navigation from the detail page to the listing page" do
		furcon = Furcon.create!(furcon_attributes)

		visit furcon_url(furcon)

		click_link "Upcoming"

		expect(current_path).to eq(furcons_path)
	end

	it "allows navigation from the listing page to the detail page" do
		furcon = Furcon.create!(furcon_attributes)

		visit furcons_url

		click_link furcon.name	#eep

		expect(current_path).to eq(furcon_path(furcon))
	end

end