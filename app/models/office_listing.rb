class OfficeListing < ActiveRecord::Base
  attr_accessible :address, :availability, :broker_id, :details, :furniture, :high_ceiling, :kitchen, :light, :move_in, :neighborhood_id, :no_of_conference_rooms, :no_of_offices, :office_type, :patio, :reception, :rent, :shower, :size, :term_length

  belongs_to :broker

  has_many :favorites
  has_many :renters, through: :favorites

  validates :address, presence: true
  validates :office_type, presence: true
  validates :size, presence: true, numericality: true
  validates :rent, presence: true, numericality: true
  validates :term_length, presence: true
  validates :availability, presence: true
  validates :neighborhood_id, presence: true
  validates :broker_id, presence: true

  def add_favorite(renter)
    renters << renter
  end

  def remove_favorite(renter)
    renters.delete(renter)
  end

end
