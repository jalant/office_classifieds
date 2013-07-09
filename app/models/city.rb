class City < ActiveRecord::Base
  attr_accessible :name, :img

  validates_presence_of :name, :img

  has_many :neighborhoods 
  has_many :office_listings, through: :neighborhoods
end
