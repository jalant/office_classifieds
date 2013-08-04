class Viewing < ActiveRecord::Base
  belongs_to :office_listing
  has_many :renters, through: :appointments

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :date, presence: true
end
