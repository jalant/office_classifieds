# == Schema Information
#
# Table name: cities
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  img        :string(255)
#

class City < ActiveRecord::Base
  attr_accessible :name, :img

  validates_presence_of :name, :img

  has_many :neighborhoods 
  has_many :office_listings, through: :neighborhoods
end
