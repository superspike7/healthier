class Food < ApplicationRecord
  belongs_to :user
  has_many :daily_intake_foods, dependent: :destroy
  has_many :daily_intakes, through: :daily_intake_foods
  has_and_belongs_to_many :meals

  validates :name, presence: true
  validates :description, length: { maximum: 24 }

  scope :all_except, ->(food) { where.not(id: food) }
end
