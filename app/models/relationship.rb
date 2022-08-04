class Relationship < ApplicationRecord
  validates :user_id, uniqueness: { scope: :followed_id }
  belongs_to :user
  belongs_to :followed, class_name: "User", foreign_key: "followed_id"
end
