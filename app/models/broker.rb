# == Schema Information
#
# Table name: brokers
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#  first_name             :string(255)
#  last_name              :string(255)
#  address                :text
#  phone_number           :string(255)
#  img_url                :string(255)
#  firm                   :string(255)
#

class Broker < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :phone_number, :address, :img_url, :firm
  # attr_accessible :title, :body
#  validates_presence_of :first_name
#  validates_presence_of :last_name
#  validates_presence_of :phone_number
  # validates_presence_of :address
  validates_presence_of :email
  # validates_presence_of :firm
  # validates_presence_of :img_url
  validates_presence_of :password
  validates_presence_of :password_confirmation
  validates :address, length: {maximum: 80}
  has_many :office_listings
  has_many :notifications 
  has_and_belongs_to_many :preference_lists

end
