class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_noticed_notifications model_name: 'Notification'

  validates :user_id, uniqueness: { scope: :post_id }

  scope :include_user_only, -> { includes(:user) }

  after_create_commit do
    broadcast_update_later_to 'likes', partial: 'posts/like',
                                       target: "post_likes_#{post.id}",
                                       locals: { post:, user: Current.user }
  end

  after_destroy_commit do
    broadcast_update_to 'likes', partial: 'posts/like',
                                 target: "post_likes_#{post.id}",
                                 locals: { post:, user: Current.user }
  end
end
