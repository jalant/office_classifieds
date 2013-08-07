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
  attr_accessible :neighborhoods, :renter_id, :id, :min_price, :max_price, :min_square_feet, :max_square_feet, :kitchen, :reception, :patio, :furniture, :lighting, :high_ceiling, :shower, :move_in, :email
  has_and_belongs_to_many :neighborhoods
  has_and_belongs_to_many :brokers
  belongs_to :renter
end
