class Like < ApplicationRecord
  validates :user_id, uniqueness: { scope: :post_id }

  belongs_to :user
  belongs_to :post

  scope :include_user_only, -> { includes(:user) }

  after_create_commit do
    broadcast_update_later_to 'likes',  partial: 'posts/like',
                                        target: "post_likes_#{post.id}",
                                        locals: { post:, user: Current.user }
  end

  after_destroy_commit do
    broadcast_update_to 'likes', partial: 'posts/like',
                                 target: "post_likes_#{post.id}",
                                 locals: { post:, user: Current.user }
  end
end

