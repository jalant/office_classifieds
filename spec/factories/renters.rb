# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :renter do
    id 1
  	email 'tj@tj.com'
  	password 'password'
  	password_confirmation 'password'
  	first_name 'Tanay'
  	last_name 'Jalan'
  	phone_number '+1(215)-771-1547'
  	address '400 W 47th Street, NY, NY'
  	img_url 'http://m3.licdn.com/mpr/pub/image-02QoHpj54tUxpRLEuNCurvxEEpLO4k9y0mnR0RLxEklZuUrX02QRpU85EZzBuky5I1Io/tanay-jalan.jpg'
  end

  factory :renter2, class: Renter do
    id 2
    email 'sj@tsj.com'
    password 'password'
    password_confirmation 'password'
    first_name 'Saurabh'
    last_name 'Jalan'
    phone_number '+1(222)-222-1547'
    address '600 W 57th Street, NY, NY'
    img_url 'http://m3.licdn.com/mpr/pub/image-02QoHpj54tUxpRLEuNCurvxEEpLO4k9y0mnR0RLxEklZuUrX02QRpU85EZzBuky5I1Io/tanay-jalan.jpg'
  end
end

