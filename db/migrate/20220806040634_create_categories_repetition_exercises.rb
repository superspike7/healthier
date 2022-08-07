class CreateCategoriesRepetitionExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :categories_repetition_exercises do |t|
      t.belongs_to :repetition_exercise
      t.belongs_to :category

      t.timestamps
    end
    add_index :categories_repetition_exercises, [:repetition_exercise_id, :category_id], unique: true,
                                                                                         name: 'categories_rep_exercises'
  end
end
