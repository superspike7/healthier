class Relationship < ApplicationRecord
  validates :user_id, uniqueness: { scope: :followed_id }
  belongs_to :user
end
