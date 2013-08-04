# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :preference_list do
    renter_id 1
    min_price 1
    max_price 1
    min_sq_feet 1
    max_sq_feet 1
    kitchen false
    reception false
    light false
    shower false
    high_ceiling false
    move_in false
    patio false
    furniture false
  end
end
