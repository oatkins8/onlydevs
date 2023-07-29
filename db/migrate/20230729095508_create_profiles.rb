class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :city
      t.string :name
      t.string :work_experience
      t.string :location
      t.string :discipline
      t.string :tech_stack
      t.text :answer_one
      t.text :answer_two
      t.text :answer_three
      t.text :answer_four
      t.text :answer_five
      t.references :user

      t.timestamps
    end
  end
end
