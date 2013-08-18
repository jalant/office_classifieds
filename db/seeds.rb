# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#

def random_t_f
  ['true', 'false'].sample
end

def rand_date
  array = []
  ((Date.today)..(Date.today + 120)).each { |date| array.push(date) }
  array.sample
end

City.delete_all
Neighborhood.delete_all
Image.delete_all
OfficeListing.delete_all
Broker.delete_all
Renter.delete_all
Favorite.delete_all
Viewing.delete_all

office_listing_data = File.open('public/office_data.txt', 'r')
office_listing_images = File.open('public/office_image_data.txt', 'r')

broker_1 = Broker.new(email: 'leejhampton@gmail.com', password: 'password123', password_confirmation: 'password123', first_name: 'Lee', last_name: 'Hampton',
                     phone_number: '775-313-4599', address: '302 W 13th Street New York NY', img_url: 'placeholder.jpg', firm: 'LeeCo')
broker_1.save!
broker_2 = Broker.create(email: 'tanayjaln@gmail.com', password: 'password123', password_confirmation: 'password123', first_name: 'Tany', last_name: 'Jalan',
                        phone_number: '902-933-1132', address: 'Somewhere in midtown', img_url: 'placeholder.jpg', firm: 'TanayCo')
renter_1 = Renter.create(email: 'tanayjaln@gmail.com', password: 'password123', password_confirmation: 'password123', first_name: 'Tany', last_name: 'Jalan')
renter_2 = Renter.create(email: 'tanayjaln@gmail.com', password: 'password123', password_confirmation: 'password123', first_name: 'Tany', last_name: 'Jalan')

new_york_city = City.create(name: 'New York', img:"http://thejointblog.com/wp-content/uploads/2013/03/nyc-condos-near-times-square-clinton.jpg")
singapore = City.create(name: 'Singapore', img:"http://thejointblog.com/wp-content/uploads/2013/03/nyc-condos-near-times-square-clinton.jpg")
hong_kong = City.create(name: 'Hong Kong', img:"http://thejointblog.com/wp-content/uploads/2013/03/nyc-condos-near-times-square-clinton.jpg")
jakarta = City.create(name: 'Jakarta', img:"http://thejointblog.com/wp-content/uploads/2013/03/nyc-condos-near-times-square-clinton.jpg")
reno = City.create(name: 'Reno', img:"http://thejointblog.com/wp-content/uploads/2013/03/nyc-condos-near-times-square-clinton.jpg")

p new_york_city


harlem = Neighborhood.create(name: "Harlem", address: "Harlem, NY", img_url: '/assets/neighborhoods/NY-NYC-Harlem2.jpg', city_id: new_york_city.id)
flatiron = Neighborhood.create(name: "Flatiron", address: "Flatiron, NY", img_url: '/assets/neighborhoods/Flatiron_NYC.jpg', city_id: new_york_city.id)
midtown_east = Neighborhood.create(name: "Midtown East", address: "Midtown East, NY", img_url: '/assets/neighborhoods/midtown_east.jpg', city_id: new_york_city.id)
financial_district = Neighborhood.create(name: "Financial District", address: "financial District, NY", img_url: '/assets/neighborhoods/financial_district.jpg', city_id: new_york_city.id)
gramercy = Neighborhood.create(name: "Gramercy", address: "Gramercy, NY", img_url: '/assets/neighborhoods/gramercy.jpg', city_id: new_york_city.id)
upper_west_side = Neighborhood.create(name: "Upper West Side", address: "Upper West Side, NY", img_url: '/assets/neighborhoods/upper_west_side.jpg', city_id: new_york_city.id)
west_village = Neighborhood.create(name: 'West Village', address: "West Village, NY", img_url: '/assets/neighborhoods/west_village.jpg', city_id: new_york_city.id)
east_village = Neighborhood.create(name: "East Village NYC", address: "East Village, NY", img_url: "/assets/neighborhoods/east_village.jpg", city_id: new_york_city.id)
hells_kitchen = Neighborhood.create(name: "Hell's Kitchen", address: "Hell's Kitchen, NY", img_url: "/assets/neighborhoods/hells_kitchen.jpg", city_id: new_york_city.id)

hood_hash = { "Harlem" => harlem, "Flatiron" => flatiron, "Midtown East" => midtown_east, 
  "Financial District" => financial_district, "Gramercy" => gramercy, "Upper West Side" => upper_west_side,
  "Union" => flatiron, "Midtown" => midtown_east, "Chelsea" => flatiron, "902" => flatiron, "16" => flatiron,
"36" => flatiron, "Turtle" => midtown_east, "Financial" => financial_district, "Lower" => financial_district,
"Upper" => gramercy, "Garment" => midtown_east}

lines = office_listing_data.lines
lines.next
lines.each do |line|
  attributes = line.split('*')
  address = attributes[0]
  unit = attributes[1]
  neighborhood = attributes[2]
  space_type = attributes[3]
  rent_type = attributes[4]
  size = attributes[5]
  price = attributes[6]

  size = 500 + rand(0..8000)
  price = 1000 + rand(0..10000)
  new_listing = OfficeListing.new(address: address, office_type: space_type, size: size, 
                       rent: price, details: "This is an office", term_length: '5 years', 
                       neighborhood_id: hood_hash[neighborhood].id, broker_id: broker_1.id, availability: "Immediately",
                        kitchen: random_t_f, reception: random_t_f, light: random_t_f, shower: random_t_f, move_in: random_t_f,
                        high_ceiling: random_t_f, patio: random_t_f, furniture: random_t_f)
  new_listing.save!
  
end


v3 = Viewing.create(start_time: "17:00", end_time: "19:00", date: rand_date)
v4 = Viewing.create(start_time: "09:00", end_time: "10:00", date: rand_date)
v5 = Viewing.create(start_time: "11:00", end_time: "12:00", date: rand_date)

OfficeListing.all.each do |listing|
  viewing = Viewing.create(start_time: "10:00", end_time: "12:00", date: rand_date)
  v2 = Viewing.create(start_time: "13:00", end_time: "15:00", date: rand_date)
  listing.viewings << viewing << v2 << v3 << v4 << v5
  listing.save!
end 

i = OfficeListing.first.id
office_listing_images.each_line do |line|
  images = line.split('*')
  images.each do |image_url|
    Image.create(link_image: image_url, office_listing_id: i)
  end
  i += 1
end

Favorite.create(office_listing_id: OfficeListing.first.id, renter_id: renter_1.id)
Favorite.create(office_listing_id: OfficeListing.last.id, renter_id: renter_1.id)
