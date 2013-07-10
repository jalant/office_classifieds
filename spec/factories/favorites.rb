# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :favorite do
    renter_id 1
    office_listing_id 1
  end

  factory :favorite_2, class: Favorite do
    renter_id 1
    office_listing_id 2
  end


  factory :favorite_3, class: Favorite do
    renter_id 2
    office_listing_id 3
  end

end
