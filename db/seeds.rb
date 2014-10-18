# LISTS

List.destroy_all

# all lists array contains titles of all seed lists - add title here
all_lists = [
	"10 Largest Countries",
	"10 Winningest F1 Drivers (all time)",
	"All Solar System Planets",
	"5 Richest Actors"
]

all_lists.each do |i|
	List.create( title: i )
end

# LIST ENTRIES

Entry.destroy_all

# Dummy variables to add list ids to each entries. New variables need to be added here with each list
ten_largest_countries_id = List.find_by title: "10 Largest Countries"
ten_winningest_f1_drivers_id = List.find_by title: "10 Winningest F1 Drivers (all time)"
all_planets_id = List.find_by title: "All Solar System Planets"
five_richest_actors_id = List.find_by title: "5 Richest Actors"

# list entries with their corresponding list ids
ten_largest_countries = [
	[ "Russia", ten_largest_countries_id.id ],
	[ "Canada", ten_largest_countries_id.id ],
	[ "China", ten_largest_countries_id.id ],
	[ "United States", ten_largest_countries_id.id ],
	[ "Brazil", ten_largest_countries_id.id ],
	[ "Australia", ten_largest_countries_id.id ],
	[ "India", ten_largest_countries_id.id ],
	[ "Argentina", ten_largest_countries_id.id ],
	[ "Kazakhstan", ten_largest_countries_id.id ],
	[ "Algeria", ten_largest_countries_id.id ]
]

ten_winningest_f1_drivers = [
	[ "Michael Schumacher", ten_winningest_f1_drivers_id.id ],
	[ "Alain Prost", ten_winningest_f1_drivers_id.id ],
	[ "Ayrton Senna", ten_winningest_f1_drivers_id.id ],
	[ "Sebastian Vettel", ten_winningest_f1_drivers_id.id ],
	[ "Fernando Alonso", ten_winningest_f1_drivers_id.id ],
	[ "Lewis Hamilton", ten_winningest_f1_drivers_id.id ],
	[ "Nigel Mansell", ten_winningest_f1_drivers_id.id ],
	[ "Jackie Stewart", ten_winningest_f1_drivers_id.id ],
	[ "Jim Clark", ten_winningest_f1_drivers_id.id ],
	[ "Niki Lauda", ten_winningest_f1_drivers_id.id ]
]

all_planets = [
	[ "Mercury", all_planets_id.id ],
	[ "Venus", all_planets_id.id ],
	[ "Earth", all_planets_id.id ],
	[ "Mars", all_planets_id.id ],
	[ "Jupiter", all_planets_id.id ],
	[ "Saturn", all_planets_id.id ],
	[ "Uranus", all_planets_id.id ],
	[ "Neptune", all_planets_id.id ],
]

five_richest_actors = [
	[ "Jerry Seinfeld", five_richest_actors_id.id ],
	[ "Shah Rukh Khan", five_richest_actors_id.id ],
	[ "Tom Cruise", five_richest_actors_id.id ],
	[ "Johnny Depp", five_richest_actors_id.id ],
	[ "Tom Hanks", five_richest_actors_id.id ],
]

# All lists - this is a list of all of our lists to loop through for creation seeding
# When adding a new list above, add the name of it to the array below
all_entries = [
	ten_largest_countries,
	ten_winningest_f1_drivers,
	all_planets,
	five_richest_actors
]

# Should not need to change the do-loop below. It will loop through the array of lists and create each text item
all_entries.each do |element|
	element.each do |entry|
		Entry.create( text: entry[0] , list_id: entry[1] )
	end
end