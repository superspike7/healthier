class CreateRepetitionExercisesRoutines < ActiveRecord::Migration[7.0]
  def change
    create_table :repetition_exercises_routines do |t|
      t.belongs_to :repetition_exercise
      t.belongs_to :routine

      t.timestamps
    end
    add_index :repetition_exercises_routines, [:repetition_exercise_id, :routine_id], unique: true,
                                                                                      name: 'rep_exercises_routines'
  end
end
