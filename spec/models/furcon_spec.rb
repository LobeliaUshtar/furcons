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

	context "upcoming query" do
		it "returns the furcons with a released on date in the future" do
			furcon = Furcon.create!(furcon_attributes(starts_on: 3.months.from_now))
			
			expect(Furcon.upcoming).to include(furcon)
		end
	end

	context "upcoming prereg query" do
		it "returns the furcons with a released on date in the future" do
			furcon = Furcon.create!(furcon_attributes(prereg_by: 3.months.from_now, starts_on: 4.months.from_now))
			
			expect(Furcon.upcoming_prereg).to include(furcon)
		end
	end

	context "recent query" do
		before do
			@furcon1 = Furcon.create!(furcon_attributes(starts_on: 3.months.ago))
			@furcon2 = Furcon.create!(furcon_attributes(starts_on: 2.months.ago))
			@furcon3 = Furcon.create!(furcon_attributes(starts_on: 1.months.ago))
			@furcon4 = Furcon.create!(furcon_attributes(starts_on: 1.week.ago))
			@furcon5 = Furcon.create!(furcon_attributes(starts_on: 1.day.ago))
			@furcon6 = Furcon.create!(furcon_attributes(starts_on: 1.hour.ago))
			@furcon7 = Furcon.create!(furcon_attributes(starts_on: 1.day.from_now))
		end

		it "returns a specified number of released furcons ordered with the most recent furcon first" do
			expect(Furcon.recent(2)).to eq([@furcon6, @furcon5])
		end

		it "returns a default of 3 released furcons ordered with the most recent furcon first" do
			expect(Furcon.recent).to eq([@furcon6, @furcon5, @furcon4])
		end
	end

	it "generates a slug when it's created" do
		furcon = Furcon.create!(furcon_attributes(name: "Gabby Con"))

		expect(furcon.slug).to eq("gabby-con")
	end

	it "requires a unique name" do
		furcon1 = Furcon.create!(furcon_attributes)

		furcon2 = Furcon.new(name: furcon1.name)
		expect(furcon2.valid?).to be_false
		expect(furcon2.errors[:name].first).to eq("has already been taken")
	end

	it "requires a unique slug" do
		furcon1 = Furcon.create!(furcon_attributes)

		furcon2 = Furcon.new(slug: furcon1.slug)
		expect(furcon2.valid?).to be_false
		expect(furcon2.errors[:slug].first).to eq("has already been taken")
	end
end