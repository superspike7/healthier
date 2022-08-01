class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  scope :comment_desc, -> { order('created_at ASC') }
  scope :include_user_only, -> { includes(:user) }
end
