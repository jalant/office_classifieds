# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :city do
    name "Singapore"
    img "http://www.sunscreen.com.sg/backgrounds/Aerial_View_of_Singapore.jpg"
  end

	factory :city2 do
    name "New York"
    img "http://thejointblog.com/wp-content/uploads/2013/03/nyc-condos-near-times-square-clinton.jpg"
  end

  factory :city3 do
    name "San Francisco"
    img "http://newleaderscouncil.org/sanfrancisco/wp-content/uploads/2013/01/1.jpg"
  end

  factory :city4 do
    name "Hong Kong"
    img "http://upload.wikimedia.org/wikipedia/en/d/d7/Hong-Kong_skyline.JPG"
  end

end
