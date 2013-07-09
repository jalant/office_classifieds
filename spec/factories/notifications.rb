# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :notification do
    subject "New Notification for Renter"
    body "Lorem ipsum get some dim sum"
    office_listing_id ""
    read false
  end
end
