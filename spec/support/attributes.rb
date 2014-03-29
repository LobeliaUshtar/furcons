def furcon_attributes(overrides = {})
	random_number = (0..9).to_a.shuffle[0..10].join
	{
		name: "Biggest Little Fur Con 2014 #{random_number}",
		website: "http://biggestlittlefurcon.org/index.php",
		location: "The Grand Sierra Resort in Reno, Nevada",
		theme: "80s Pop Culture",
		starts_on: "2014-03-28",
		ends_on: "2014-03-30",
		charities: "Safe Haven Rescue Zoo",
		guest_of_honor: "Sidian (Linsey Huish), Kijani",
		prereg_by: "2014-02-28",
		image_file_name: "Biggest_Little_Fur_Con_2014.png"
	}.merge(overrides)
end

def membership_attributes(overrides = {})
	{
		name: "Radical",
		swag: "Attendance, A collectible BLFC poker chip!",
		prereg_fee: 30.00,
		reg_fee: 40.00
	}.merge(overrides)
end

def user_attributes(overrides = {})
	{
		name: "Example User",
		email: "user@example.com",
		password: "secret",
		password_confirmation: "secret",
		username: "G00fyPuppy"
	}.merge(overrides)
end