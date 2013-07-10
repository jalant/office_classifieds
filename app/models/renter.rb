class Renter < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :first_name, :last_name, :phone_number, :address, :img_url
  # attr_accessible :title, :body


  # validates_presence_of :first_name
  # validates_presence_of :last_name
  # validates_presence_of :phone_number
  # validates_presence_of :address 
  validates_presence_of :email
 # validates_presence_of :img_url
  validates_presence_of :password
  validates_presence_of :password_confirmation


  validates :address, length: {maximum: 80} 
  has_many :notifications
  has_many :favorites
  has_many :office_listings, through: :favorites

end
