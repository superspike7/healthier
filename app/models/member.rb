class Member < ApplicationRecord
  belongs_to :conversation, counter_cache: true
  belongs_to :user

  scope :other_username, ->(user) { where.not(user:).first_username }
  scope :first_username, -> { first&.user&.username }
end
