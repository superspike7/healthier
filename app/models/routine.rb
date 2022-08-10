class Routine < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :repetition_exercises, -> { distinct }
  has_and_belongs_to_many :timed_exercises, -> { distinct }

  validates :name, presence: true
  validates :description, length: { maximum: 24 }

  scope :include_associations, lambda {
    includes([:routines_timed_exercises, :repetition_exercises_routines,
              :timed_exercises, :repetition_exercises])
  }

  def add_exercise_in_routine(exercises)
    repetition_exercises << RepetitionExercise.find(exercises[:repetition])
    timed_exercises << TimedExercise.find(exercises[:timed])
  end

  def remove_timed_exercise(timed_exercise)
    timed_exercises.destroy(timed_exercise)
  end

  def remove_repetition_exercise(repetition_exercise)
    repetition_exercises.destroy(repetition_exercise)
  end
end
