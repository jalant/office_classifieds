class CreateViewings < ActiveRecord::Migration
  def change
    create_table :viewings do |t|
      t.integer :office_listing_id
      t.date :date
      t.time :start_time
      t.time :end_time
      t.text :notes

      t.timestamps
    end
  end
end
