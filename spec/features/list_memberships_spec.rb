require 'spec_helper'

describe "Viewing a list of memberships" do
	
	it "shows the memberships for a specific furcon" do
		furcon1 = Furcon.create(furcon_attributes(name: "Biggest Little Fur Con 2014"))
		membership1 = furcon1.memberships.create(membership_attributes(name: "Radical"))
		membership2 = furcon1.memberships.create(membership_attributes(name: "Tubular"))

		furcon2 = Furcon.create(furcon_attributes(name: "Elliott's Spring Gathering 2014"))
		membership3 = furcon2.memberships.create(membership_attributes(name: "~"))
		
		visit furcon_memberships_url(furcon1)
				
		expect(page).to have_text(membership1.name)
		expect(page).to have_text(membership2.name)
		expect(page).not_to have_text(membership3.name)
	end
end