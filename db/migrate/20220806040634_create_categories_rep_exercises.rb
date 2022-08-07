class CreateCategoriesRepExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :rep_categ do |t|
      t.belongs_to :rep_exercise
      t.belongs_to :exercise_category

      t.timestamps
    end
    add_index :rep_categ, [:rep_exercise_id, :exercise_category_id], unique: true
  end
end
