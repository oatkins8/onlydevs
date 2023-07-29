class AddTechStackToProfiles < ActiveRecord::Migration[7.0]
  def change
    add_column :profiles, :tech_stack, :text, array: true, default: []
  end
end
