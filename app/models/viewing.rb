class Viewing < ActiveRecord::Base
  belongs_to :office_listing

  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :date, presence: true
end
