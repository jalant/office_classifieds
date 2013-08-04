# == Schema Information
#
# Table name: renters
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
#  preference_list_id     :integer
#

class Renter < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :preference_list_id, :last_name, :phone_number, :address, :img_url
  validates_presence_of :email
  validates_presence_of :password
  validates_presence_of :password_confirmation


  validates :address, length: {maximum: 80} 
  has_many :notifications
  has_many :favorites
  has_many :appointments
  has_many :office_listings, through: :favorites
  has_many :viewings, through: :appointments
  has_one :preference_list

  def add_appointment(viewing)
    viewings << viewing
  end

  def remove_appointment(viewing)
    viewings.delete(viewing)
  end

  def add_favorite(favorite)
    favorites << favorite
  end

  def remove_favorite(favorite)
    favorites.delete(favorite)
  end
  
  def add_preference_list(preference_list)
    preference_list = preference_list
  end

  def remove_preference_list(preference_list)
    unless preference_list.nil?
      PreferenceList.find(preference_list.id).delete
    end
  end

end
