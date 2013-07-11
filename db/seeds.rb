# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#

City.delete_all
Neighborhood.delete_all
Image.delete_all
OfficeListing.delete_all
Broker.delete_all
Renter.delete_all

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
p new_york_city

harlem = Neighborhood.create(name: "Harlem", img_url: 'placeholder.jpg', city_id: new_york_city.id)
flatiron = Neighborhood.create(name: "Flatiron", img_url: 'placeholder.jpg', city_id: new_york_city.id)
midtown_east = Neighborhood.create(name: "Midtown East", img_url: 'placeholder.jpg', city_id: new_york_city.id)
financial_district = Neighborhood.create(name: "Financial District", img_url: 'placeholder.jpg', city_id: new_york_city.id)
gramercy = Neighborhood.create(name: "Gramercy", img_url: 'placeholder.jpg', city_id: new_york_city.id)
upper_west_side = Neighborhood.create(name: "Upper West Side", img_url: 'placeholder.jpg', city_id: new_york_city.id)

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

  if size == ''
    size = 0
  else
    size = size.to_i
  end

  if price == ''
    price = 0
  else
    price = price.to_i
  end

  new_listing = OfficeListing.new(address: address, office_type: space_type, size: size, 
                       rent: price, details: "This is an office", term_length: '5 years', 
                       neighborhood_id: hood_hash[neighborhood].id, broker_id: broker_1.id, availability: "Immediately")
  new_listing.save!
end

i = OfficeListing.first.id
office_listing_images.each_line do |line|
  images = line.split('*')
  images.each do |image_url|
    Image.create(url: image_url, office_listing_id: i)
  end
  i += 1
end

