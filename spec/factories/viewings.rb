# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :viewing do
    office_listing_id 1
    date "2013-08-01"
    start_time "2013-08-01 10:21:07"
    end_time "2013-08-01 13:21:07"
    notes "MyText"
  end
end
