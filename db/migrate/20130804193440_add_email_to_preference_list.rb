class AddEmailToPreferenceList < ActiveRecord::Migration
  def change
    add_column :preference_lists, :email, :boolean
  end
end
