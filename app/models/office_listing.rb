# == Schema Information
#
# Table name: office_listings
#
#  id                     :integer          not null, primary key
#  address                :string(255)
#  office_type            :string(255)
#  size                   :integer
#  rent                   :integer
#  details                :text
#  kitchen                :boolean
#  reception              :boolean
#  light                  :boolean
#  shower                 :boolean
#  move_in                :boolean
#  high_ceiling           :boolean
#  patio                  :boolean
#  furniture              :boolean
#  term_length            :string(255)
#  availability           :string(255)
#  no_of_offices          :integer
#  no_of_conference_rooms :integer
#  neighborhood_id        :integer
#  broker_id              :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class OfficeListing < ActiveRecord::Base
  attr_accessible :address, :availability, :broker_id, :details, :furniture, :high_ceiling, :kitchen, :light, :move_in, :neighborhood_id, :no_of_conference_rooms, :no_of_offices, :office_type, :patio, :reception, :rent, :shower, :size, :term_length, :latitude, :longitude 

  belongs_to :broker
  belongs_to :neighborhood


  has_many :favorites
  has_many :renters, through: :favorites
  has_many :images

  validates :address, presence: true
  validates :office_type, presence: true
  validates :size, presence: true, numericality: true
  validates :rent, presence: true, numericality: true
  validates :term_length, presence: true
  validates :availability, presence: true
  validates :neighborhood_id, presence: true
  validates :broker_id, presence: true

  geocoded_by :address
  before_save :geocode

  def add_favorite(renter)
    renters << renter
  end

  def remove_favorite(renter)
    renters.delete(renter)
  end

end
