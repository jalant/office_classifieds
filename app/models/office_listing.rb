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
#  kitchen                :boolean          default(FALSE)
#  reception              :boolean          default(FALSE)
#  light                  :boolean          default(FALSE)
#  shower                 :boolean          default(FALSE)
#  move_in                :boolean          default(FALSE)
#  high_ceiling           :boolean          default(FALSE)
#  patio                  :boolean          default(FALSE)
#  furniture              :boolean          default(FALSE)
#  term_length            :string(255)
#  availability           :string(255)
#  no_of_offices          :integer
#  no_of_conference_rooms :integer
#  neighborhood_id        :integer
#  broker_id              :integer
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  latitude               :float
#  longitude              :float
#

class OfficeListing < ActiveRecord::Base
  attr_accessible :address, :availability, :broker_id, :details, :furniture, :high_ceiling, :kitchen, :light, :move_in, :neighborhood_id, :no_of_conference_rooms, :no_of_offices, :office_type, :patio, :reception, :rent, :shower, :size, :term_length, :latitude, :longitude 

  belongs_to :broker
  belongs_to :neighborhood


  has_many :favorites
  has_many :renters, through: :favorites
  has_many :images
  has_many :viewings

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

  def add_viewing(viewing)
    viewings << viewing
  end

  def check_for_matching_neighborhood(neighborhood_list)
    neighborhood_list.inject(false) { |memo, neighb|  neighborhood.id == neighb.id || memo }
  end

  def check_for_matching_broker(broker_list)
    broker_list.inject(false) { |memo, brkr|  broker.id == brkr.id || memo }
  end

  def check_matching_amenity(is_checking, amenity)
    if is_checking
      send(amenity) # execute symbol as method to get instance amenity attribute
    else # if preference list hasn't specified that a renter is looking for that item, always return true
      true
    end
  end

end
