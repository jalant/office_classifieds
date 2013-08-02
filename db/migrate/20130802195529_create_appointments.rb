class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.integer :viewing_id
      t.integer :renter_id

      t.timestamps
    end
  end
end
