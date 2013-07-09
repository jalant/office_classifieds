# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :neighborhood do
    name "West Harlem"
    city_id 1
  end

  factory :neighborhood_2, class: Neighborhood do
    name "Park Slope"
    city_id 1
  end

  factory :neighborhood_3, class: Neighborhood do
    name "Carroll Gardens"
    city_id 1
  end
end
