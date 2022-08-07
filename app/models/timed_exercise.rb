class TimedExercise < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories

  validates :name, presence: true
  validates :hour, presence: true
  validates :minutes, presence: true

  scope :all_except, ->(timed_exercise) { where.not(id: timed_exercise) }
end
