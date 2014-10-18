List.destroy_all

List.create([
	{ title: "10 Largest Countries" },
	{ title: "10 Winningest F1 Drivers (all time)" }
])

Entry.destroy_all

# Lists to be seeded for testing purposes

# List.find_by title: "10 Largest Countries"
# test_var_two = List.find_by title: "10 Winningest F1 Drivers (all time)"

ten_largest_countries = [
	[ "Russia" ],
	[ "Canada" ],
	[ "China" ],
	[ "United States" ],
	[ "Brazil" ],
	[ "Australia" ],
	[ "India" ],
	[ "Argentina" ],
	[ "Kazakhstan" ],
	[ "Algeria" ]
]

ten_winningest_f1_drivers = [
	[ "Michael Schumacher" ],
	[ "Alain Prost" ],
	[ "Ayrton Senna" ],
	[ "Sebastian Vettel" ],
	[ "Fernando Alonso" ],
	[ "Lewis Hamilton" ],
	[ "Nigel Mansell" ],
	[ "Jackie Stewart" ],
	[ "Jim Clark" ],
	[ "Niki Lauda" ],
]

# All lists - this is a list of all of our lists to loop through for creation seeding
# When adding a new list above, add the name of it to the array below

all_lists = [
	ten_largest_countries, ten_winningest_f1_drivers 
]

# Should not need to change the do-loop below. It will loop through the array of lists and create each text item

all_lists.each do |element|
	element.each do |text, list_id|
		List.Entry.create( text: text )
	end
end