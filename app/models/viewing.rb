# == Schema Information
#
# Table name: viewings
#
#  id                :integer          not null, primary key
#  office_listing_id :integer
#  date              :date
#  start_time        :time
#  end_time          :time
#  notes             :text
#  created_at        :datetime
#  updated_at        :datetime
#

class Viewing < ActiveRecord::Base

  attr_accessible :start_time, :end_time, :date, :office_listing_id
  belongs_to :office_listing
  has_many :renters, through: :appointments

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :date, presence: true
end
