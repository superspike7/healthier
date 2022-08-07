class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :repetition_exercises, -> { distinct }
  has_and_belongs_to_many :timed_exercises, -> { distinct }

  def add_exercise_in_category(exercises)
    repetition_exercises << RepetitionExercise.find(exercises[:repetition])
    timed_exercises << TimedExercise.find(exercises[:timed])
  end
end
