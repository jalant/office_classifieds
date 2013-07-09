class OfficeListing < ActiveRecord::Base
  attr_accessible :address, :availability, :broker_id, :details, :furniture, :high_ceiling, :kitchen, :light, :move_in, :neighborhood_id, :no_of_conference_rooms, :no_of_offices, :office_type, :patio, :reception, :rent, :shower, :size, :term_length

  belongs_to :broker
end
