class RepetitionExercise < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :categories

  validates :name, presence: true
  validates :repetition, presence: true
  validates :set, presence: true
end
