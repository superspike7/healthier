class Like < ApplicationRecord

  validates :user_id, uniqueness: { scope: :post_id }

  belongs_to :user
  belongs_to :post

  scope :include_user_only, -> { includes(:user) }
end
