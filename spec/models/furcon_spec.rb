require 'spec_helper'

describe "A furcon" do
	it "requires a names" do
		furcon = Furcon.new(name: "")
		
		expect(furcon.valid?).to be_false
		expect(furcon.errors[:name].any?).to be_true
	end

	it "requires a website" do
		furcon = Furcon.new(website: "")
		
		expect(furcon.valid?).to be_false
		expect(furcon.errors[:website].any?).to be_true
	end

	it "requires a location" do
		furcon = Furcon.new(location: "")
		
		expect(furcon.valid?).to be_false
		expect(furcon.errors[:location].any?).to be_true
	end

	it "requires a start" do
		furcon = Furcon.new(starts_on: "")
		
		expect(furcon.valid?).to be_false
		expect(furcon.errors[:starts_on].any?).to be_true
	end

	it "requires an end" do
		furcon = Furcon.new(ends_on: "")
		
		expect(furcon.valid?).to be_false
		expect(furcon.errors[:ends_on].any?).to be_true
	end

	it "requires a prereg date" do
		furcon = Furcon.new(prereg_by: "")
		
		expect(furcon.valid?).to be_false
		expect(furcon.errors[:prereg_by].any?).to be_true
	end

	it "accepts properly formatted image file names" do
		file_names = %w[e.png furcon.png furcon.jpg furcon.gif FURCON.GIF]
		file_names.each do |file_name|
			furcon = Furcon.new(image_file_name: file_name)
			
			expect(furcon.valid?).to be_false
			expect(furcon.errors[:image_file_name].any?).to be_false
		end
	end

	it "rejects improperly formatted image file names" do
		file_names = %w[furcon .jpg .png .gif furcon.pdf furcon.doc]
		file_names.each do |file_name|
			furcon = Furcon.new(image_file_name: file_name)
			
			expect(furcon.valid?).to be_false
			expect(furcon.errors[:image_file_name].any?).to be_true
		end
	end

	it "has many memberships" do
		furcon = Furcon.new(furcon_attributes)

		membership1 = furcon.memberships.new(membership_attributes)
		membership2 = furcon.memberships.new(membership_attributes)

		expect(furcon.memberships).to include(membership1)
		expect(furcon.memberships).to include(membership2)
	end

	it "deletes associated memberships" do
		furcon = Furcon.create(furcon_attributes)

		furcon.memberships.create(membership_attributes)

		expect { 
			furcon.destroy
		}.to change(Membership, :count).by(-1)
	end

end