class CreateTimedExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :timed_exercises do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.integer :hour
      t.integer :minutes

      t.timestamps
    end
  end
end
