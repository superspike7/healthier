class CreateRoutinesTimedExercises < ActiveRecord::Migration[7.0]
  def change
    create_table :routines_timed_exercises do |t|
      t.belongs_to :timed_exercise
      t.belongs_to :routine

      t.timestamps
    end

    add_index :routines_timed_exercises, [:timed_exercise_id, :routine_id], unique: true,
                                                                            name: 'routines_time_exercises'
  end
end
