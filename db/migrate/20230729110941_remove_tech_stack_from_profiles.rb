class RemoveTechStackFromProfiles < ActiveRecord::Migration[7.0]
  def change
    remove_column :profiles, :tech_stack
  end
end
