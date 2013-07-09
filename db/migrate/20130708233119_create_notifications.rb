class CreateNotifications < ActiveRecord::Migration
  def change
    create_table :notifications do |t|
      t.string :subject
      t.text :body
      t.integer :office_listing_id
      t.boolean :read

      t.timestamps
    end
  end
end
