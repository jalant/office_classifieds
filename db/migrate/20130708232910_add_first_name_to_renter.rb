class AddFirstNameToRenter < ActiveRecord::Migration
  def change
  	add_column :renters, :first_name, :string
  	add_column :renters, :last_name, :string
  	add_column :renters, :address, :text
  	add_column :renters, :phone_number, :string
  	add_column :renters, :img_url, :string 	  	
  end
end


