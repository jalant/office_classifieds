# == Schema Information
#
# Table name: neighborhoods
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  city_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  img_url    :string(255)
#  latitude   :float
#  longitude  :float
#  address    :text
#

class Neighborhood < ActiveRecord::Base
  attr_accessible :city_id, :img_url, :name, :address, :latitude, :longitude
  validates :name, presence: true, length: { in: 3..50 }

  belongs_to :city
  has_many :office_listings
  has_and_belongs_to_many :preference_lists

  geocoded_by :address 
  before_save :geocode
end
