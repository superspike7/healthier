class CreateCategoriesTimedExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_timed_exercises do |t|
      t.belongs_to :timed_exercise
      t.belongs_to :category

      t.timestamps
    end

    add_index :categories_timed_exercises, [:timed_exercise_id, :category_id], unique: true,
                                                                               name: 'categories_time_exercises'
  end
end
