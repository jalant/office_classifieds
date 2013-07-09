class AddBrokerIdAndRenterIdToNotification < ActiveRecord::Migration
  def change
    add_column(:notifications, :broker_id, :integer)
    add_column(:notifications, :renter_id, :integer)
  end
end
