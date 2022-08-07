class Category < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :repetition_exercises, -> { distinct }
  has_and_belongs_to_many :timed_exercises, -> { distinct }
end
