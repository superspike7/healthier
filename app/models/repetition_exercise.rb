class RepetitionExercise < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :routines

  validates :name, presence: true
  validates :repetition, presence: true
  validates :set, presence: true

  scope :all_except, ->(repetition_exercise) { where.not(id: repetition_exercise) }
end
