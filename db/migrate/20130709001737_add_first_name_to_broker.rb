class AddFirstNameToBroker < ActiveRecord::Migration
  def change
    add_column :brokers, :first_name, :string
    add_column :brokers, :last_name, :string
    add_column :brokers, :address, :text
    add_column :brokers, :phone_number, :string
    add_column :brokers, :img_url, :string
    add_column :brokers, :firm, :string
  end
end
