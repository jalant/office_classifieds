class Neighborhood < ActiveRecord::Base
  attr_accessible :city_id, :img_url, :name
  validates :name, presence: true, length: { in: 3..50 }

  belongs_to :city
  has_many :office_listings
end
