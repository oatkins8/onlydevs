class AddProfileToQuestions < ActiveRecord::Migration[7.0]
  def change
    add_reference :questions, :profile, null: false, foreign_key: true
  end
end
