class Notification < ActiveRecord::Base
  attr_accessible :body, :office_listing_id, :read, :subject

  validates :subject, presence: true, length: { maximum: 60 }
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
