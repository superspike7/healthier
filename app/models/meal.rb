class Meal < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :description, length: { maximum: 24 }
end
