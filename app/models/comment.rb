class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post
  has_noticed_notifications model_name: 'Notification'

  validates :body, presence: true

  scope :comment_asc, -> { order('created_at ASC') }
  scope :include_user_only, -> { includes(:user) }

  after_create_commit do
    broadcast_update_later_to 'comments', partial: 'posts/comment',
                                          target: "post_comments_#{post.id}",
                                          locals: { post:, user: Current.user }
  end

  after_destroy_commit do
    broadcast_update_to 'comments', partial: 'posts/comment',
                                    target: "post_comments_#{post.id}",
                                    locals: { post:, user: Current.user }
  end

  def add(sender:, receiver:)
    return unless save
    return true if sender == receiver

    CommentNotification.with(user: sender, post:, comment: self).deliver_later(receiver)
  end

  def destroy_including_notifications
    destroy
    notifications_as_comment.destroy_all
  end
end
