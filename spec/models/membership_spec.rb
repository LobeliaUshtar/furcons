require 'spec_helper'

describe "A membership" do

	it "belongs to a furcon" do
		furcon = Furcon.create(furcon_attributes)

		membership = furcon.memberships.new(membership_attributes)

		expect(membership.furcon).to eq(furcon)
	end

	it "with valid example attributes" do
		membership = Membership.new(membership_attributes)

		expect(membership.valid?).to be_true
	end

	it "requires a name" do
		membership = Membership.new(name: "")

		expect(membership.valid?).to be_false
		expect(membership.errors[:name].any?).to be_true
	end

	it "requires a prereg fee" do
		membership = Membership.new(prereg_fee: "")

		expect(membership.valid?).to be_false
		expect(membership.errors[:prereg_fee].any?).to be_true
	end

	it "requires a reg fee" do
		membership = Membership.new(reg_fee: "")

		expect(membership.valid?).to be_false
		expect(membership.errors[:reg_fee].any?).to be_true
	end

end