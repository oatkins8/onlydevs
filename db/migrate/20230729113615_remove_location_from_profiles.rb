class RemoveLocationFromProfiles < ActiveRecord::Migration[7.0]
  def change
    remove_column :profiles, :location
  end
end
