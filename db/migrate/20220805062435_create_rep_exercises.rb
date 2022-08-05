class CreateRepExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :rep_exercises do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name
      t.text :description
      t.integer :repetition
      t.integer :set

      t.timestamps
    end
  end
end
