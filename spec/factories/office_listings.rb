# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :office_listing do
    address "20 E Broadway, New York, NY 10030"
    office_type "Lease"
    size 1342
    rent 1975
    details "MyText"
    kitchen true
    reception false
    light true
    shower false
    move_in false
    high_ceiling true
    patio true
    furniture false
    term_length "5-7 yrs"
    availability "Immediate"
    no_of_offices 1
    no_of_conference_rooms 1
    neighborhood_id 1
    broker_id 1
  end

  factory :office_listing_2, class: OfficeListing do
    address "1 E. 21st Street New York, NY"
    office_type "Lease"
    size 1342
    rent 1975
    details "MyText"
    kitchen false
    reception false
    light false
    shower false
    move_in false
    high_ceiling false
    patio false
    furniture false
    term_length "5-7 yrs"
    availability "Immediate"
    no_of_offices 1
    no_of_conference_rooms 1
    neighborhood_id 1
    broker_id 1
  end
  factory :office_listing_3, class: OfficeListing do
    address "30 E Broadway, New York, NY 10010"
    office_type "Lease"
    size 1342
    rent 1975
    details "MyText"
    kitchen false
    reception false
    light false
    shower false
    move_in false
    high_ceiling false
    patio false
    furniture false
    term_length "5-7 yrs"
    availability "Immediate"
    no_of_offices 1
    no_of_conference_rooms 1
    neighborhood_id 1
    broker_id 1
  end

  factory :office_listing_4, class: OfficeListing do
    address "1 E. 21st Street New York, NY"
    office_type "Lease"
    size 1342
    rent 1975
    details "MyText"
    kitchen false
    reception false
    light false
    shower false
    move_in false
    high_ceiling false
    patio false
    furniture false
    term_length "5-7 yrs"
    availability "Immediate"
    no_of_offices 1
    no_of_conference_rooms 1
    neighborhood_id 1
    broker_id 1
  end

  factory :office_listing_5, class: OfficeListing do
    address "1 E. 21st Street New York, NY"
    office_type "Lease"
    size 1342
    rent 1975
    details "MyText"
    kitchen false
    reception false
    light false
    shower false
    move_in false
    high_ceiling false
    patio false
    furniture false
    term_length "5-7 yrs"
    availability "Immediate"
    no_of_offices 1
    no_of_conference_rooms 1
    neighborhood_id 2
    broker_id 1
  end

end
