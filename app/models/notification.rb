# == Schema Information
#
# Table name: notifications
#
#  id                :integer          not null, primary key
#  subject           :string(255)
#  body              :text
#  office_listing_id :integer
#  read              :boolean
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  broker_id         :integer
#  renter_id         :integer
#

class Notification < ActiveRecord::Base
  attr_accessible :body, :office_listing_id, :read, :renter_id, :subject

  validates :subject, presence: true, length: { maximum: 100 }
  validates :body, length: { maximum: 300 }
  belongs_to :office_listing
  belongs_to :renter
  belongs_to :broker

  def mark_as_read
    self.read = true
  end

  def mark_as_unread
    self.read = false
  end
end
