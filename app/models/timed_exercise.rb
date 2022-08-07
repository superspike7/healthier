class TimedExercise < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :exercise_categories
end
