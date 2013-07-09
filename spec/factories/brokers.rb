# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :broker do
  	email 'lh@lh.com'
  	password 'password'
  	password_confirmation 'password'
  	first_name 'Lee'
  	last_name 'Hampton'
  	firm 'Quvat'
  	phone_number '+1(215)-771-1547'
  	address '555 W 47th Street, NY, NY'
  	img_url 'http://m3.licdn.com/mpr/pub/image-02QoHpj54tUxpRLEuNCurvxEEpLO4k9y0mnR0RLxEklZuUrX02QRpU85EZzBuky5I1Io/tanay-jalan.jpg'
  end
end
