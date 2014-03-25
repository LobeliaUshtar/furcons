Furcon.create!([
	{
		name: "Biggest Little Fur Con 2014",
		website: "http://biggestlittlefurcon.org/index.php",
		location: "The Grand Sierra Resort in Reno, Nevada",
		theme: "80s Pop Culture",
		starts_on: "2014-03-28",
		ends_on: "2014-03-30",
		charities: "Safe Haven Rescue Zoo",
		guest_of_honor: "Sidian (Linsey Huish), Kijani",
		prereg_by: "2014-02-28",
		image_file_name: "Biggest_Little_Fur_Con_2014.png"
	},
	{
		name: "Elliott's Spring Gathering 2014",
		website: "https://esg.elliottsliveevents.org/",
		location: "The Palms Casino Resort in Las Vegas, Nevada",
		theme: "Elliott's Spring Gathering",
		starts_on: "2014-05-09",
		ends_on: "2014-05-11",
		charities: "",
		guest_of_honor: "",
		prereg_by: "2014-01-01",
		image_file_name: "Elliotts.jpg"
	},
	{
		name: "Anthrocon 2014",
		website: "http://www.anthrocon.org/",
		location: "David L. Lawrence Convention Center in Pittsburgh, Pennsylvania",
		theme: "Secret Societies",
		starts_on: "2014-07-03",
		ends_on: "2014-07-06",
		charities: "",
		guest_of_honor: "Lee Tockar",
		prereg_by: "2014-06-13",
		image_file_name: "Anthrocon.jpg"
	},
	{
		name: "RainFurrest 2014",
		website: "https://www.rainfurrest.org/2014/",
		location: "Hilton Seattle Airport in Seattle, Washington",
		theme: "Cyberpunk",
		starts_on: "2014-09-25",
		ends_on: "2014-09-28",
		charities: "",
		guest_of_honor: "",
		prereg_by: "2014-09-01",
		image_file_name: ""
	},
	{
		name: "Further Confusion 2015",
		website: "http://www.furtherconfusion.org/2015/",
		location: "San Jose Convention Center, San Jose Marriott, and San Jose Hilton in San Jose, California",
		theme: "Victorian Murder Mystery",
		starts_on: "2015-01-15",
		ends_on: "2015-01-19",
		charities: "",
		guest_of_honor: "",
		prereg_by: "2014-12-31",
		image_file_name: "Further_Confusion_2015.png"
	}
])

User.create!([
	{
		name: "Gabby",
		email: "gabby@example.com",
		username: "gabby",
		password: "secret",
		password_confirmation: "secret",
		admin: true
	}
])


furcon = Furcon.find_by(name: 'Biggest Little Fur Con 2014')
furcon.memberships.create!(name: "Radical", prereg_fee: 30.00, reg_fee: 40.00, swag: "Attendance ~ A collectible BLFC poker chip!")
furcon.memberships.create!(name: "Tubular", prereg_fee: 65.00, reg_fee: 75.00, swag: "Attendance ~ A collectible BLFC poker chip! ~ Convention T-shirt ~ A bitchin' collectible Rubik's Cube ~ A mention in the con book! (Register by Jan 31) ~ A 5% chance of a free membership for next year")
furcon.memberships.create!(name: "To The Max", prereg_fee: 90.00, reg_fee: 100.00, swag: "Attendance ~ A collectible BLFC poker chip! ~ Convention T-shirt ~ A bitchin' collectible Rubik's Cube ~ A rad convention hoodie! ~ A mention in the con book! (Register by Jan 31) ~ A 10% chance of a free membership for next year")
furcon.memberships.create!(name: "SingleDay", prereg_fee: 0.00, reg_fee: 30.00, swag: "One Day Attendance Only ~ Upgrade anytime to full attendance for $10 more")

furcon = Furcon.find_by(name: "Elliott's Spring Gathering 2014")
furcon.memberships.create!(name: "~", prereg_fee: 55.00, reg_fee: 65.00, swag: "Attendance")