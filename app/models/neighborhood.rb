class Neighborhood < ActiveRecord::Base
  attr_accessible :city_id, :name
  validates :name, presence: true, length: { in: 3..50 }
end
