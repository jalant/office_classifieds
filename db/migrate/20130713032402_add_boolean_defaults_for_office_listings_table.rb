class AddBooleanDefaultsForOfficeListingsTable < ActiveRecord::Migration
  def change
    change_column :office_listings, :kitchen, :boolean, default: false
    change_column :office_listings, :reception, :boolean, default: false
    change_column :office_listings, :light, :boolean, default: false
    change_column :office_listings, :shower, :boolean, default: false
    change_column :office_listings, :move_in, :boolean, default: false
    change_column :office_listings, :high_ceiling, :boolean, default: false
    change_column :office_listings, :patio, :boolean, default: false
    change_column :office_listings, :furniture, :boolean, default: false
  end
end
