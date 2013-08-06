# == Schema Information
#
# Table name: preference_lists
#
#  id           :integer          not null, primary key
#  renter_id    :integer
#  min_price    :integer
#  max_price    :integer
#  min_sq_feet  :integer
#  max_sq_feet  :integer
#  kitchen      :boolean
#  reception    :boolean
#  light        :boolean
#  shower       :boolean
#  high_ceiling :boolean
#  move_in      :boolean
#  patio        :boolean
#  furniture    :boolean
#  created_at   :datetime
#  updated_at   :datetime
#  email        :boolean
#

class PreferenceList < ActiveRecord::Base
  has_and_belongs_to_many :neighborhoods
  has_and_belongs_to_many :brokers
  belongs_to :renter
end
