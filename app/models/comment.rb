class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  validates :body, presence: true

  scope :comment_desc, -> { order('created_at ASC') }
  scope :include_user_only, -> { includes(:user) }
end
