# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :office_listing do
    address "MyString"
    office_type "MyString"
    size 1
    rent 1
    details "MyText"
    kitchen false
    reception false
    light false
    shower false
    move_in false
    high_ceiling false
    patio false
    furniture false
    term_length "MyString"
    availability "MyString"
    no_of_offices 1
    no_of_conference_rooms 1
    neighborhood_id 1
    broker_id 1
  end
end
